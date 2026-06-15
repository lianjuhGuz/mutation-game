extends Area2D
class_name Trash

@onready var color_rect: ColorRect = $ColorRect
@onready var jeringa: Jeringa = $"../Jeringa"
var dentro: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if dentro and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		jeringa.hide()
		jeringa.changue("null", Color(1.0, 1.0, 1.0, 1.0))


func _on_area_entered(area: Area2D) -> void:
	print("area entrada:", area)
	if area.name == "JeringaArea":
		print("AREA NECESARIA DETECTADA")
		dentro=true


func _on_area_exited(area: Area2D) -> void:
	print("area salida:", area)
	if area.name == "JeringaArea":
		print("AREA NECESARIA DETECTADA")
		dentro=false
