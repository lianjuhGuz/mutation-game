extends Node2D
class_name Inyection

@export_group("Datos Necesarios")

@export_enum("Alexidium", "Lianjuhm", "Blawaxim", "Zobyxa", "Homoalexiu") var efecto: String
@onready var pocion: Sprite2D = $Pocion
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var name_injection: Label = $Hoja/NameInjection


var dentro: bool = false

signal insertar_en_jeringa(efecto: String)

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	if efecto == "Alexidium":
		pocion.texture = preload("uid://vqqigxgj7jwj")
		name_injection.text = "Alexidium"
		
	elif efecto == "Lianjuhm":
		pocion.texture = preload("uid://c6udsbqf804w3")
		name_injection.text = "Lianjuhm"
		
	elif efecto == "Blawaxim":
		pocion.texture = preload("uid://k1is4b34e7ox")
		name_injection.text = "Blawaxim"
		
	elif efecto == "Zobyxa":
		pocion.texture = preload("uid://byn0ud1e4076c")
		name_injection.text = "Zobyxa"
		
	elif efecto == "Homoalexiu":
		pocion.texture = preload("uid://bbhonbinb3co3")
		name_injection.text = "Homoalexiu"
		
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
