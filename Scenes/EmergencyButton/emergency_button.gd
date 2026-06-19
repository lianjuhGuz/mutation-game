extends Area2D
class_name EmergencyButton

@export var file_reset: String = "Aqui va el cambio de escena"
@onready var animation: AnimationPlayer = $AnimationPlayer
var dentro: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and dentro:
		GameManager.health_points = 100
		get_tree().change_scene_to_file(file_reset)


func _on_mouse_entered() -> void:
	animation.play("show_label")
	dentro = true

func _on_mouse_exited() -> void:
	animation.play_backwards("show_label")
	dentro = false
