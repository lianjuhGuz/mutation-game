extends Node2D
class_name Inyection

@export_group("Datos Necesarios")

@export_enum("Alexidium", "Lianjuhm", "Blawaxim", "Zobyxa", "Fresquixiu") var efecto: String
@onready var pocion: Sprite2D = $Pocion
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var name_injection: Label = $Hoja/NameInjection


var dentro: bool = false

signal insertar_en_jeringa(efecto: String)

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	if efecto == "Alexidium":
		pocion.texture = preload("uid://cl300i73wmfuy")
		name_injection.text = "Alexidium"
		
	elif efecto == "Lianjuhm":
		pocion.texture = preload("uid://blg0iii2lcolq")
		name_injection.text = "Lianjuhm"
		
	elif efecto == "Blawaxim":
		pocion.texture = preload("uid://bjlen5pkexdqq")
		name_injection.text = "Blawaxim"
		
	elif efecto == "Zobyxa":
		pocion.texture = preload("uid://dbag57gamlvcy")
		name_injection.text = "Zobyxa"
		
	elif efecto == "Fresquixiu":
		pocion.texture = preload("uid://blabljvcj0a55")
		name_injection.text = "Fresquixiu"
		
	else:
		pocion.texture = preload("uid://cf104i6k6la0g")
		print("pocion default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and dentro:
		print("Clic presionado y esa vaina dentro")
		print("efecto generado: ", efecto)
		insertar_en_jeringa.emit(efecto)


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("area entrada: ", area.name)
	if area.name == "JeringaArea" and area.visible:
		dentro = true
		print("Dentro? ", dentro, "Visible? ")


@warning_ignore("unused_parameter")
func _on_area_2d_area_exited(area: Area2D) -> void:
	dentro = false


func _on_area_2d_mouse_entered() -> void:
	animation.play("show_details")


func _on_area_2d_mouse_exited() -> void:
	animation.play_backwards("show_details")
