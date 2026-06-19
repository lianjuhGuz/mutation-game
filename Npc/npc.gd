extends Node2D
class_name NPC

@onready var sprite: AnimatedSprite2D = $NPCArea/AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $NPCArea/CollisionShape2D
@onready var npc_area: Area2D = $NPCArea
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var button: Button = $Button

var jeringa_dentro: bool = false
var current_effects: Array = []
var dominant_effect: String = ""

signal emit_effects(efectos: Array)
signal emitir_efecto_dominante(efecto_dominante: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameManager.current_level == 1:
		sprite.play("default")
		
	elif GameManager.current_level == 2:
		sprite.play("brocoli_default")
		
	elif GameManager.current_level == 3:
		sprite.play("teacher_default")
		
	elif GameManager.current_level == 4:
		sprite.play("bro_default")
	
	else:
		sprite.play("default_transform_error")

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if jeringa_dentro and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("Jeringa dentro y click presionado")
 	
	if current_effects.size() >= 3:
		print("OH, sobredosis de efectos")
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
	animation.play("dead_animation")
	sprite.stop()
	button.hide()

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


func _on_button_pressed() -> void:
	if GameManager.current_level == 1:
		DialogueManager.show_dialogue_balloon(preload("uid://b8rg51nk2vt7o"), "FirstLevel")
		
	if GameManager.current_level == 2 and GameManager.dialogue_count == 0:
		DialogueManager.show_dialogue_balloon(preload("uid://b8rg51nk2vt7o"), "SecondLevel1")
		GameManager.dialogue_count += 1
		
	if GameManager.current_level == 2 and GameManager.dialogue_count >= 1:
		DialogueManager.show_dialogue_balloon(preload("uid://b8rg51nk2vt7o"), "SecondLevel2")
