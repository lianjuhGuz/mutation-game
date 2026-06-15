extends Node2D

@onready var color_rect: ColorRect = $Area2D/ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass


func _on_area_2d_mouse_entered() -> void:
	print("mouse entró")
	color_rect.color = Color(1.0, 0.0, 0.0, 1.0)

func _on_area_2d_mouse_exited() -> void:
	print("mouse salió")
	color_rect.color = Color(0.318, 0.601, 0.487, 1.0)
