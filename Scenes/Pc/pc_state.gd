extends Node2D

@onready var current_temperature: Label = $ColorRect4/VBoxContainer/BodyCurrent/CurrentTemperature
@onready var ideal_temperature: Label = $"ColorRect4/VBoxContainer/Body ideal/IdealTemperature"
@onready var progress_health: ProgressBar = $ColorRect4/VBoxContainer/Health/ProgressHealth
@onready var progress_cordure: ProgressBar = $ColorRect4/VBoxContainer/Cordure/ProgressCordure

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(GameManager.current_temperature_body)


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	changue_temperature()

func _on_less_pressed() -> void:
	if GameManager.current_temperature_air <= 0:
		GameManager.current_temperature_air = 0
		return
	GameManager.current_temperature_air -= 0.5


func _on_more_pressed() -> void:
	if GameManager.current_temperature_air >= 45:
		GameManager.current_temperature_air = 45
		return
	GameManager.current_temperature_air += 0.5


func changue_temperature():
	current_temperature.text = str(GameManager.current_temperature_body, " C")
	ideal_temperature.text = str(GameManager.better_temperature, " C")
	progress_health.value = GameManager.health_points/100
