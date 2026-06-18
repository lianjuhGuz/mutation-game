extends Node2D
class_name  PapperDetails

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var hoja: Sprite2D = $CanvasLayer/Control/Hoja


var dentro: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hoja.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and dentro:
		print("mostrando hoja? ", hoja.visible)
		hoja.show()
	
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and not dentro:
		print("ocultando hoja")
		hoja.hide()
	
	elif Input.is_action_just_pressed("left"):
		print("ocultando hoja")
		hoja.hide()
		
	elif Input.is_action_just_pressed("right"):
		print("ocultando hoja")
		hoja.hide()
	
func _on_area_2d_mouse_entered() -> void:
	animation.play("show_label")
	dentro = true


func _on_area_2d_mouse_exited() -> void:
	animation.play_backwards("show_label")
	dentro = false
	hoja.hide()
