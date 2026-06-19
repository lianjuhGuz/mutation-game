extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SoundManager.play_music(preload("uid://beqhrpn7dwpmi"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_variable")
func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Cinematics/cinematic_npc.tscn")


func _on_creddits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Credits/credits.tscn")


func _on_exit_button_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()
