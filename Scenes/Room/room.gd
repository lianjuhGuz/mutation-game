extends Node2D

@onready var jeringa: Node2D = $Jeringa
@onready var npc: NPC = $Npc

var cursor_image = load("res://assets/cursorCustom.png")
var level: int = GameManager.current_level

func _ready() -> void:
	Input.set_custom_mouse_cursor(cursor_image)
	print(Input.MOUSE_MODE_HIDDEN)
	get_level()

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

func _on_jeringa_set_effect(efecto: String) -> void:
	npc.añadir_efecto(efecto)


func _on_table_inyections_on_inyection_insertar_en_jeringa(efect: Variant) -> void:
	jeringa.changue(efect)

func get_level():
	print("nivel: ", level)
	
