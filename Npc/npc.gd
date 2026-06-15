extends Node2D
class_name NPC


@onready var sprite: AnimatedSprite2D = $NPCArea/AnimatedSprite2D

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
		var tween = get_tree().create_tween()
		tween.tween_property(sprite, "self_modulate", Color(1.0, 0.0, 0.0, 1.0), 10)
		print("strong virus añadido")
		
	elif efecto == "MagicVirus":
		print("MagicVirus añadido")
		var tween = get_tree().create_tween()
		tween.tween_property(sprite, "scale", Vector2(0.3, 0.3), 10)
		
	elif efecto == "null":
		print("le inyectaste al paciente puro aire, lo maste")
		kill_npc()
	else:
		print("Otro virus fue añadido, santiago es gay")


@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body: Node2D) -> void:
	jeringa_dentro = true


@warning_ignore("unused_parameter")
func _on_area_2d_body_exited(body: Node2D) -> void:
	jeringa_dentro = false
 

func kill_npc():
	queue_free()
