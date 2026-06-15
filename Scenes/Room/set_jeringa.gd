extends Area2D
class_name SetJeringa

@onready var jeringa: Jeringa = $"../Jeringa"
@onready var animation: AnimationPlayer = $AnimationPlayer

var dentro: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	jeringa.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	
	if dentro and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and not jeringa.visible:
		print("usando jeringa")
		jeringa.show()
		animation.play("use_box")
		await animation.animation_finished
		animation.play_backwards("use_box")
	
	
func _on_mouse_entered() -> void:
	dentro = true
	print("dentro de la vasija? ", dentro)

func _on_mouse_exited() -> void:
	dentro = false
	print("Salió", not dentro)
