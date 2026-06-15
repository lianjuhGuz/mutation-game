extends Camera2D

var target_right: Vector2 = Vector2(self.global_position.x + 320, self.global_position.y )
var target_left: Vector2 = Vector2(self.global_position.x - 314, self.global_position.y )

var movimiento: bool = false
var num_movimiento: int = 1 #para el mero centro

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("right") and not movimiento and num_movimiento < 2:
		print("moviendo a la derecha")
		var tween = get_tree().create_tween()
		movimiento = true
		tween.tween_property(self, "global_position", target_right, 1)
		await tween.finished
		movimiento = false
		num_movimiento +=1
		print("movimiento: der",  num_movimiento)

	elif event.is_action_pressed("left") and not movimiento and num_movimiento > 0:
		print("moviendo a la izquierda")
		var tween = get_tree().create_tween()
		movimiento = true
		tween.tween_property(self, "global_position", target_left, 1)
		await tween.finished
		movimiento = false
		num_movimiento -=1
		print("movimiento: izq",  num_movimiento)

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if num_movimiento >= 2:
		num_movimiento = 2
	
	if num_movimiento <= 0:
		num_movimiento = 0
	
	target_right = Vector2(self.global_position.x + 320, self.global_position.y )
	target_left = Vector2(self.global_position.x - 320, self.global_position.y )
	
