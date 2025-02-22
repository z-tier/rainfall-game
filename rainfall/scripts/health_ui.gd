extends Control

@onready var health_label = $Label

func update_health_ui(health):
	health_label.text = "Health: " + str(health)
