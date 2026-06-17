extends Area2D
class_name Trash

@onready var trash_sprite: Sprite2D = $TrashSprite
@onready var jeringa: Jeringa = $"../Jeringa"
@onready var animation: AnimationPlayer = $AnimationPlayer

var dentro: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if dentro and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and jeringa.visible:
		jeringa.hide()
		jeringa.changue("null")
		animation.play("Use")
		await animation.animation_finished
		animation.play_backwards("Use")

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
