extends Area2D
class_name SetJeringa

@onready var jeringa: Jeringa = $"../Jeringa"

var dentro: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	jeringa.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	
	if dentro and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("usando jeringa")
		jeringa.show()
	
	

func _on_mouse_entered() -> void:
	dentro = true
	print("dentro de la vasija? ", dentro)

func _on_mouse_exited() -> void:
	dentro = false
	print("Salió", not dentro)
