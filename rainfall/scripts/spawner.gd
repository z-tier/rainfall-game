extends Node2D

@export var rain_scene : PackedScene
@export var default_rain = 1

func _ready():
	position = Vector2.ZERO
	$Timer.connect("timeout", _on_timer_timeout)
	
	match GameData.difficulty:
		"light":
			$Timer.wait_time = default_rain * 0.03
		"heavy":
			$Timer.wait_time = default_rain * 0.01
		"storm":
			$Timer.wait_time = default_rain * 0.01
			
	$Timer.start()

func _on_timer_timeout():
	if rain_scene:
		var raindrop = rain_scene.instantiate()
		
		var screen_width = get_viewport_rect().size.x
		raindrop.position = Vector2(randi_range(0, screen_width), position.y)
		add_child(raindrop)
