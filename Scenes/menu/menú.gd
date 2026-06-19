extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Cinematics/cinematic_npc.tscn")


func _on_creddits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Credits/credits.tscn")


func _on_exit_button_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()
