extends Node2D
class_name Jeringa

@onready var jeringa_base: Sprite2D = $JeringaArea/JeringaBase
@onready var jeringa_area: Area2D = $JeringaArea

var efecto_actual: String = "null"
var dentro: bool = false

signal set_effect(efecto: String)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	if dentro and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and efecto_actual != null and visible:
		set_effect.emit(efecto_actual)
		#changue("null", Color(1.0, 1.0, 1.0, 1.0))
		jeringa_base.texture = preload("uid://cj3ptyl1fluig")
		hide()
	
	if not visible:
		jeringa_area.hide()
	
	else:
		jeringa_area.show()


func changue(efecto: String):
	if efecto == "null":
		jeringa_base.texture = preload("uid://ctewofp4lyc0j")
	
	#Cambiar textura jeringa
	
	if efecto == "Alexidium":
		jeringa_base.texture = preload("uid://djb8otlxg6drn")
		
	elif efecto == "Lianjuhm":
		jeringa_base.texture = preload("uid://c6avp6o5hp706")
		
	elif efecto == "Blawaxim":
		jeringa_base.texture = preload("uid://c1ckwb70vn31h")
		
	elif efecto == "Zobyxa":
		jeringa_base.texture = preload("uid://jiy5rlsjf8m0")
		
	elif efecto == "Homoalexiu":
		jeringa_base.texture = preload("uid://ypxmbc5hsnv6")
		
	else:
		jeringa_base.texture = preload("uid://ctewofp4lyc0j")
	efecto_actual = efecto


func _on_jeringa_area_area_entered(area: Area2D) -> void:
	if area.name == "NPCArea":
		dentro = true


func _on_jeringa_area_area_exited(area: Area2D) -> void:
	if area.name == "NPCArea":
		dentro = false
