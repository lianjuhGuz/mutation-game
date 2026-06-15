extends Node2D
class_name Inyection

@export_group("Datos Necesarios")
@export var color_modulate: Color
@export_enum("StrongVirus", "SpeedVirus", "MagicVirus", "RegenerationVirus", "CurationVirus") var efecto: String
@onready var color_rect: ColorRect = $ColorRect

var dentro: bool = false

signal insertar_en_jeringa(efecto: String, color: Color)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_rect.color = color_modulate


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and dentro:
		print("Clic presionado y esa vaina dentro")
		print("efecto generado: ", efecto)
		insertar_en_jeringa.emit(efecto, color_modulate)
		
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("area entrada: ", area.name)
	if area.name == "JeringaArea" and area.visible:
		dentro = true
		print("Dentro? ", dentro, "Visible? ")

@warning_ignore("unused_parameter")
func _on_area_2d_area_exited(area: Area2D) -> void:
	dentro = false
