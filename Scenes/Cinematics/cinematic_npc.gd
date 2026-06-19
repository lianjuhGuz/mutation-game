extends Node2D

@onready var animation: AnimationPlayer = $AnimationPlayer

var dialogue1 = preload("uid://b8rg51nk2vt7o")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameManager.current_level == 1:
		print("primer dialogo, para el primer nivel")
		await get_tree().create_timer(1).timeout
		animation.play("aparition")
		await animation.animation_finished
		await get_tree().create_timer(0.5).timeout
		DialogueManager.show_dialogue_balloon(dialogue1, "level1")
		await DialogueManager.dialogue_ended
		get_tree().change_scene_to_file("res://Scenes/Room/room.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass
