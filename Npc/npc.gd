extends Node2D
class_name NPC
@onready var color_rect: ColorRect = $ColorRect

var jeringa_dentro: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if jeringa_dentro and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("Jeringa dentro y click presionado")
 		

func añadir_efecto(efecto: String):
	if efecto == "StrongVirus":
		print("Strong Virus añadido")
		color_rect.color = Color(0.0, 0.397, 0.0, 1.0)
	elif efecto == "MagicVirus":
		print("MagicVirus añadido")
		color_rect.color = Color(0.607, 0.158, 0.134, 1.0)
	elif efecto == "null":
		print("le inyectaste al paciente puro aire, lo maste")
		kill_npc()
	else:
		print("Otro virus fue añadido, santiago es gay")
		color_rect.color = Color(0.797, 0.484, 0.085, 1.0)


@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body: Node2D) -> void:
	jeringa_dentro = true


@warning_ignore("unused_parameter")
func _on_area_2d_body_exited(body: Node2D) -> void:
	jeringa_dentro = false
 

func kill_npc():
	queue_free()
