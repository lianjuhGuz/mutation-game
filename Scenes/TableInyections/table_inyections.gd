extends Node2D
class_name TableInyections

var efect: String = "null"

signal on_inyection_insertar_en_jeringa(efect)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass


func _on_inyection_insertar_en_jeringa(efecto: String) -> void:
	efect = efecto
	on_inyection_insertar_en_jeringa.emit(efect)
