extends Node2D

@onready var current_temperature: Label = $ColorRect4/VBoxContainer/BodyCurrent/CurrentTemperature
@onready var ideal_temperature: Label = $"ColorRect4/VBoxContainer/Body ideal/IdealTemperature"
@onready var progress_health: ProgressBar = $ColorRect4/VBoxContainer/Health/ProgressHealth
@onready var progress_cordure: ProgressBar = $ColorRect4/VBoxContainer/Cordure/ProgressCordure
@onready var temperature_air: Label = $ColorRect4/VBoxContainer/Air/FirstFirst/Second/TemperatureAir

var porc_air: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(GameManager.current_temperature_body)
	changue_temperature_body()


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	changue_temperature()

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
	

func repeat_changue_temperature_body():
	await get_tree().create_timer(4).timeout
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
