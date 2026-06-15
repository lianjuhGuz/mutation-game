extends Node

var current_level: int = 1


var health_points: float = 100
var better_temperature: float 
var current_temperature: float 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass


func get_better_temperature():
	if current_level == 1:
		randf_range(35.7, 38.3)
		
	if current_level == 2:
		randf_range(20, 32)
		
	if current_level == 3:
		randf_range(40.7, 58.3)
		
