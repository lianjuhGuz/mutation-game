extends Node2D
class_name Jeringa

@onready var color_rect: ColorRect = $JeringaArea/ColorRect

signal set_effect(efecto: String)

var efecto_actual
var dentro: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	if dentro and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and efecto_actual != null:
		set_effect.emit(efecto_actual)


func changue(efecto: String, color: Color):
	color_rect.color = color
	efecto_actual = efecto

func _on_jeringa_area_area_entered(area: Area2D) -> void:
	if area.name == "NPCArea":
		dentro = true


func _on_jeringa_area_area_exited(area: Area2D) -> void:
	if area.name == "NPCArea":
		dentro = false
