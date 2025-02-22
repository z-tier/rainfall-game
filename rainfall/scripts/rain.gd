extends Area2D

var screen_height = Vector2.ZERO

func _ready():
	screen_height = get_viewport_rect().size

func _process(delta):
	position.y += 200 * delta
	
	if position.y > screen_height.y:
		queue_free()
