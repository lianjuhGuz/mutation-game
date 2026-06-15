extends Node2D

@onready var current_temperature: Label = $ColorRect4/VBoxContainer/BodyCurrent/CurrentTemperature
@onready var ideal_temperature: Label = $"ColorRect4/VBoxContainer/Body ideal/IdealTemperature"
@onready var progress_health: ProgressBar = $ColorRect4/VBoxContainer/Health/ProgressHealth
@onready var progress_cordure: ProgressBar = $ColorRect4/VBoxContainer/Cordure/ProgressCordure

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass
