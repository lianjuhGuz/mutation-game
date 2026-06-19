extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SoundManager.play_music(preload("uid://beqhrpn7dwpmi"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu/menú.tscn")
