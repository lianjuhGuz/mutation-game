extends Node2D

@onready var jeringa: Node2D = $Jeringa
@onready var npc: NPC = $Npc

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	print(Input.MOUSE_MODE_HIDDEN)

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

func _on_inyection_insertar_en_jeringa(efecto: String, color: Color) -> void:
	jeringa.changue(efecto, color)


func _on_jeringa_set_effect(efecto: String) -> void:
	npc.añadir_efecto(efecto)
