extends Node2D
class_name NPC


@onready var sprite: AnimatedSprite2D = $NPCArea/AnimatedSprite2D

var jeringa_dentro: bool = false
var current_effects: Array = []
var dominant_effect: String = ""

signal emit_effects(efectos: Array)
signal emitir_efecto_dominante(efecto_dominante: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if jeringa_dentro and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("Jeringa dentro y click presionado")
 	
	if current_effects.size() >= 3:
		kill_npc()


func añadir_efecto(efecto: String):
		
	if efecto == "Alexidium":
		var tween = get_tree().create_tween()
		tween.tween_property(sprite, "self_modulate", Color(1.0, 0.0, 0.0, 1.0), 10)
		print("Alexidium añadido")
		current_effects.append("Alexidium")
		print("efectos: ", current_effects)
		
	elif efecto == "Lianjuhm":
		print("Lianjuhm añadido")
		var tween = get_tree().create_tween()
		tween.tween_property(sprite, "scale", Vector2(0.7, 0.7), 10)
		current_effects.append("Lianjuhm")
		print("efectos: ", current_effects)
	
	elif efecto == "Blawaxim":
		print("Blawaxim añadido")
		var tween = get_tree().create_tween()
		tween.tween_property(sprite, "self_modulate", Color(0.655, 0.152, 0.496, 1.0), 10)
		current_effects.append("Blawaxim")
		print("efectos: ", current_effects)
		
	elif efecto == "Zobyxa":
		print("Zobyxa añadido")
		var tween = get_tree().create_tween()
		tween.tween_property(sprite, "scale", Vector2(0.3, 0.7), 10)
		current_effects.append("Zobyxa")
		print("Efectos: ", current_effects)
		
	elif efecto == "Homoalexiu":
		print("Homoalexiu añadido")
		var tween = get_tree().create_tween()
		tween.tween_property(sprite, "scale", Vector2(-1, -1), 10)
		current_effects.append("Homoalexiu")
		print("efectos: ", current_effects)
	
	elif efecto == "null":
		print("le inyectaste al paciente puro aire, lo maste")
		kill_npc()
		
	else:
		print("Otro virus fue añadido, santiago es gay")
		
	if current_effects.size() == 2:
		print("MAXIMOS EFECTOS YA")
		emit_effects.emit(current_effects)
	
	if current_effects.size() > 0:
		emitir_efecto_dominante.emit(current_effects.back())
	

@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body: Node2D) -> void:
	jeringa_dentro = true


@warning_ignore("unused_parameter")
func _on_area_2d_body_exited(body: Node2D) -> void:
	jeringa_dentro = false
 

func kill_npc():
	GameManager.health_points = 0
	current_effects.clear()
	dominant_effect = ""
	queue_free()


func start_challengue_temperature():
	if dominant_effect == "Alexidium":
		GameManager.better_temperature = 10
		
	elif dominant_effect == "Lianjuhm":
		GameManager.better_temperature = 37
		
	elif dominant_effect == "Blawaxim":
		GameManager.better_temperature = 40
		
	elif dominant_effect == "Zobyxa":
		GameManager.better_temperature = 22
		
	elif dominant_effect == "Homoalexiu":
		GameManager.better_temperature = 11
	
	else:
		print("de donde sacaste eso we")
