extends Node2D

@onready var flash = $ColorRect

var flashing = false

func _ready():
	flash.color.a = 0
	$Timer.connect("timeout", _on_timer_timeout)
	start_lightning()
	
func start_lightning():
	if GameData.difficulty == "storm":
		$Timer.start(randf_range(2, 5))
		
func flash_lightning():
	if flashing:
		return
	
	flashing = true
	flash.color.a = 1

	var tween = get_tree().create_tween()
	tween.tween_property(flash, "color:a", 0, 0.5)
	
	await tween.finished
	flashing = false

func _on_timer_timeout():
	flash_lightning()
	start_lightning()
