extends Camera2D

var target_right: Vector2 = Vector2(self.global_position.x + 320, self.global_position.y )
var target_left: Vector2 = Vector2(self.global_position.x - 314, self.global_position.y )

var movimiento: bool = false
var num_movimiento: int = 1 #para el mero centro
var can_move: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.connect("dialogue_started", Callable(self, "_on_dialogue_started"))
	DialogueManager.connect("dialogue_ended", Callable(self, "_on_dialogue_ended"))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("right") and not movimiento and num_movimiento < 2 and can_move:
		print("moviendo a la derecha")
		var tween = get_tree().create_tween()
		movimiento = true
		tween.tween_property(self, "global_position", target_right, 0.5)
		await tween.finished
		movimiento = false
		num_movimiento +=1
		print("movimiento: der",  num_movimiento)

	elif event.is_action_pressed("left") and not movimiento and num_movimiento > 0 and can_move:
		print("moviendo a la izquierda")
		var tween = get_tree().create_tween()
		movimiento = true
		tween.tween_property(self, "global_position", target_left, 0.5)
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
	

func _on_dialogue_ended(dialogue):
	can_move = true
	print("Dialogo?", dialogue)


func _on_dialogue_started(dialogue):
	can_move = false
	print("Dialogo?", dialogue)
