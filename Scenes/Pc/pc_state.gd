extends Node2D
class_name Pc

@onready var current_temperature: Label = $ColorRect4/VBoxContainer/BodyCurrent/CurrentTemperature
@onready var ideal_temperature: Label = $"ColorRect4/VBoxContainer/Body ideal/IdealTemperature"
@onready var progress_health: ProgressBar = $ColorRect4/VBoxContainer/Health/ProgressHealth
@onready var progress_cordure: ProgressBar = $ColorRect4/VBoxContainer/Cordure/ProgressCordure
@onready var temperature_air: Label = $ColorRect4/VBoxContainer/Air/FirstFirst/Second/TemperatureAir
@onready var timer_progress: Timer = $TimerProgress
@onready var timer_lose: Timer = $TimerLose
@onready var time_label: Label = $"Time label"

var max_temp_range: float = GameManager.better_temperature + 1.2
var min_temp_range: float = GameManager.better_temperature - 1.2
var porc_air: float = 0
var in_progress: bool = false
var progress_count: int = 0
var time_label_left: String = ""

signal npc_dead
signal win_level
signal finish_first

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(GameManager.current_temperature_body)
	changue_temperature_body()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	changue_temperature()
	validar_estabilidad_temperatura()
	
	#Por si algun timer está activo, significa que el progreso sigue en pie
	#(Segunda fase de lo que puse en el cuaderno)
	if timer_lose.is_stopped() and timer_progress.is_stopped():
		print("todo bien papu, inyecta")
		in_progress = false
		
	else:
		print("cuidado papu, falta tiempo")
		
		if not timer_lose.is_stopped():
			print("timer_lose está activo")
			
		if not timer_progress.is_stopped():
			print("timer_progress está activo")
		in_progress = true
	
	#para comprobar que no se mezclan 
	if not timer_progress.is_stopped():
		timer_lose.stop()
		
	if not timer_lose.is_stopped():
		timer_progress.stop()


func _on_less_pressed() -> void:
	if GameManager.current_temperature_air <= 0:
		GameManager.current_temperature_air = 0
		return
	GameManager.current_temperature_air -= 0.5


func _on_more_pressed() -> void:
	print("Aire añadido")
	if GameManager.current_temperature_air >= 45:
		GameManager.current_temperature_air = 45
		return
		
	else:
		print("aire: ", GameManager.current_temperature_air)
		GameManager.current_temperature_air += 0.5


func changue_temperature():
	current_temperature.text = "%.1f C" % GameManager.current_temperature_body
	ideal_temperature.text = str(GameManager.better_temperature, " C")
	progress_health.value = GameManager.health_points/100
	temperature_air.text = str(GameManager.current_temperature_air, " C")
	time_label_left = str(int(timer_progress.time_left))
	time_label.text = "time left: " + time_label_left


func repeat_changue_temperature_body():
	await get_tree().create_timer(2).timeout
	changue_temperature_body()


func changue_temperature_body():
	print("Cambiando la temperatura del cuerpo del npc")
	if GameManager.current_temperature_air > GameManager.current_temperature_body:
		porc_air = GameManager.current_temperature_air / GameManager.current_temperature_body
		GameManager.current_temperature_body += porc_air
		repeat_changue_temperature_body()
		
	else:
		porc_air = GameManager.current_temperature_body / GameManager.current_temperature_air 
		GameManager.current_temperature_body -= porc_air
		repeat_changue_temperature_body()


#Cuando termina el timer de muerte, simplemente, pues muere XD
#tercera fase del cuaderno
func _on_timer_lose_timeout() -> void:
	print("npc muriendo, inestabilidad de temperatura")
	npc_dead.emit()


func _on_timer_progress_timeout() -> void:
	if progress_count >= 2:
		print("felicidades, completaste la comb, estoy estresandome XD")
		win_level.emit()
		progress_count = 0
		
	else:
		print("cantidad de progreso: ", progress_count)
		progress_count += 1
		timer_progress.stop()
		finish_first.emit()
		

#Si la temperatura es estable...
#cuarta fase del cuaderno (PORFIN PARECE SERVIR)
func validar_estabilidad_temperatura() -> void:
	if not in_progress:
		return
	max_temp_range = GameManager.better_temperature + 1.2
	min_temp_range = GameManager.better_temperature - 1.2

	var temp_cuerpo = GameManager.current_temperature_body
	
	print("minima temperatura del cuerpo requerida:", min_temp_range)
	print("maxima temperatura del cuerpo requerida:", max_temp_range)
	print("Mejor temperatura según game Manager:", GameManager.better_temperature)
	
	#Si está dentro de la temperatura correcta, pues avanza el progreso
	if temp_cuerpo >= min_temp_range and temp_cuerpo <= max_temp_range:
		#empieza la 6ta fase, iniciar el timer para ganar
		if timer_progress.is_stopped():
			timer_progress.start()
			print("Temperatura en rango")
	
	#si no, pues reinicia el timer de perder
	#Quinta fase del cuaderno
	else:
		print("validar_estabilidad_temperatura() se ha detectado que timer lose continuará")
		if not timer_progress.is_stopped():
			timer_progress.stop()
			timer_lose.start()
		
