extends Node2D

@onready var animation: AnimationPlayer = $AnimationPlayer

var dialogue1 = preload("uid://b8rg51nk2vt7o")
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SoundManager.play_music(preload("uid://cfd7xiid16d7r"))
	GameManager.health_points = 100
	if GameManager.current_level == 1:
		print("primer dialogo, para el primer nivel")
		await get_tree().create_timer(1).timeout
		animation.play("aparition")
		await animation.animation_finished
		await get_tree().create_timer(0.5).timeout
		DialogueManager.show_dialogue_balloon(dialogue1, "level1")
		await DialogueManager.dialogue_ended
		get_tree().change_scene_to_file("res://Scenes/Room/room.tscn")
	
	if GameManager.current_level == 2:
		GameManager.dialogue_count = 0
		print("segundo dialogo, para el segundo nivel")
		await get_tree().create_timer(1).timeout
		animation.play("aparition")
		await animation.animation_finished
		await get_tree().create_timer(0.5).timeout
		DialogueManager.show_dialogue_balloon(dialogue1, "level2")
		await DialogueManager.dialogue_ended
		get_tree().change_scene_to_file("res://Scenes/Room/room.tscn")
		
	if GameManager.current_level == 3:
		GameManager.dialogue_count = 0
		print("tercer dialogo, para el tercer nivel")
		await get_tree().create_timer(1).timeout
		animation.play("aparition")
		await animation.animation_finished
		await get_tree().create_timer(0.5).timeout
		DialogueManager.show_dialogue_balloon(dialogue1, "level3")
		await DialogueManager.dialogue_ended
		get_tree().change_scene_to_file("res://Scenes/Room/room.tscn")
		
	if GameManager.current_level == 4:
		GameManager.dialogue_count = 0
		print("Cuarto dialogo, para el cuarto nivel")
		await get_tree().create_timer(1).timeout
		animation.play("aparition")
		await animation.animation_finished
		await get_tree().create_timer(0.5).timeout
		DialogueManager.show_dialogue_balloon(dialogue1, "level4")
		await DialogueManager.dialogue_ended
		get_tree().change_scene_to_file("res://Scenes/Room/room.tscn")

	if GameManager.current_level >= 5:
		GameManager.dialogue_count = 0
		print("Cuarto dialogo, para el cuarto nivel")
		await get_tree().create_timer(1).timeout
		DialogueManager.show_dialogue_balloon(dialogue1, "ThankYouForPlay")
		await DialogueManager.dialogue_ended
		animation_player.play("Close Eyes")
		await  animation_player.animation_finished
		DialogueManager.show_dialogue_balloon(dialogue1, "GameOver")
		await DialogueManager.dialogue_ended
		SoundManager.play_sfx(preload("uid://d2cpicqtv0opc"))
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://Scenes/Credits/credits.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass
