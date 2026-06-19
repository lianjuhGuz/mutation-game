extends Node2D
class_name Room

@onready var jeringa: Node2D = $Jeringa
@onready var npc: NPC = $Npc
@onready var pc_state: Pc = $RoomSprite3/PcState

var cursor_image = preload("uid://dr3putlqllhw8")
var level: int = GameManager.current_level
var combinacion_req: Array = []
var dominant_effect: String = ""


func _ready() -> void:
	Input.set_custom_mouse_cursor(cursor_image)
	DialogueManager.show_dialogue_balloon(preload("uid://b8rg51nk2vt7o"), "Instructions")
	print(Input.MOUSE_MODE_HIDDEN)
	get_level()


@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass


func _on_jeringa_set_effect(efecto: String) -> void:
	#si se puede inyectar, hacemos una comprobación. octava fase
	#del cuaderno
	if pc_state.in_progress == true:
		return
	npc.añadir_efecto(efecto)
	GameManager.health_points -= 10
	comprobate_timer_progress()


func _on_table_inyections_on_inyection_insertar_en_jeringa(efect: Variant) -> void:
	jeringa.changue(efect)

func get_level():
	print("nivel: ", level)
	if level == 1:
		combinacion_req = ["Alexidium" ,"Homoalexiu"]
		
	elif level == 2:
		combinacion_req = ["Zobyxa" ,"Blawaxim"]
		
	elif level == 3:
		combinacion_req = ["Lianjuhm" ,"Alexidium"]
		
	elif level == 4:
		combinacion_req = ["Homoalexiu" ,"Zobyxa"]
		
	else:
		print("Felicidades, completaste el juego")
		
	print("efectos: ", combinacion_req)
	

func _on_pc_state_npc_dead() -> void:
	npc.kill_npc()

func _on_pc_state_win_level() -> void:
	print("good, next progress")


func _on_npc_emit_effects(efectos: Array) -> void:
	
	print("efecto dominante:", dominant_effect)
	
	if efectos == combinacion_req:
		print("efectos:", efectos)
		print("los efectos requeridos concuerdan")
		print("ganaste el juego, bien hecho")
	else:
		print("tremendo pendejo, efectos incorrectos")
	

func comprobate_timer_progress():
	if pc_state.timer_progress.is_stopped():
		pc_state.timer_progress.start()
		
	elif pc_state.timer_progress.time_left > 0:
		print("no ha terminado, matarás al npc")
		#npc.kill_npc()


func _on_pc_state_finish_first() -> void:
	npc.start_challengue_temperature()
	pc_state.in_progress = false

#ya me perdí, me tocó comentar
#FUNCION PARA DAR EL EFECTO DOMINANTE, para que esta vaina devuelva el 
#efecto con su respectiva temp (primera fase de lo que puse en el cuaderno)
func _on_npc_emitir_efecto_dominante(efecto_dominante: String) -> void:
	dominant_effect = efecto_dominante
	print("efecto dominante: ", efecto_dominante)
	if pc_state.in_progress:
		npc.kill_npc()
	
	
	if dominant_effect == "Alexidium":
		print("Temperatura recomendada alexidium: 10 C")
		GameManager.better_temperature = 10

	elif dominant_effect == "Lianjuhm":
		print("Temperatura recomendada alexidium: 37 C")
		GameManager.better_temperature = 37
		
	elif dominant_effect == "Blawaxim":
		print("Temperatura recomendada alexidium: 10 C")
		GameManager.better_temperature = 40
		
	elif dominant_effect == "Zobyxa":
		print("Temperatura recomendada alexidium: 10 C")
		GameManager.better_temperature = 22
		
	if dominant_effect == "Homoalexiu":
		print("Temperatura recomendada alexidium: 10 C")
		GameManager.better_temperature = 11
	
	pc_state.timer_lose.start()
	
	if not pc_state.timer_progress.is_stopped():
		print("EMPEZÓ EL TIMER DE PROGRESO")
		print("Mejor temperatura según GameMAnager: ", GameManager.better_temperature)
