extends CharacterBody2D

@export var speed = 250
@export var health = 5
var HealthUI = preload("res://scenes/health_ui.tscn")
var stopwatch = preload("res://scenes/stopwatch.tscn")
var dead = false
var disabled = false
var screen_size
var health_ui

func _ready():
	$AnimatedSprite2D.play()
	screen_size = get_viewport_rect().size
	
	position = Vector2(screen_size.x / 2, screen_size.y / 2)
	
	$"Hit detector".connect("area_entered", _on_hit_detector_area_entered)
	
	print("you have ", health, " hp")
	
	health_ui = HealthUI.instantiate()
	add_child(health_ui)
		
func _physics_process(delta):
	if dead:
		return
		
	var pos = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = pos * speed
	move_and_slide()
	
	position = position.clamp(Vector2(20, 300), screen_size - Vector2(20, 20))
	
func _on_hit_detector_area_entered(area):
	if dead:
		return
	else:
		damage()

func update_health_ui():
	if health_ui:
		health_ui.get_node("Label").text = "Health: " + str(health)

func damage():
	if dead:
		return
	
	health -= 1
	update_health_ui()
	var shrink = Vector2(0.05, 0.05)
	$AnimatedSprite2D.scale -= shrink
	$"Hit detector/CollisionShape2D".scale -= shrink
	print("took damage, hp: ", health)
	
	if health == 0:
		if disabled:
			return
		
		print("you died lol")
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.visible = false
		dead = true
		
		var main_scene = get_tree().current_scene
		
		if main_scene.has_method("disable_stopwatch"):
			main_scene.disable_stopwatch()

		if health_ui:
			health_ui.queue_free()  
		
		var ui_layer = Control.new()
		main_scene.add_child(ui_layer)
		
		var game_over = RichTextLabel.new()
		game_over.bbcode_enabled = true
		game_over.text = "game over lol\nreturning to main menu in 3s..."
		game_over.add_theme_font_size_override("normal_font_size", 20)
		game_over.size = Vector2(400, 100)
		game_over.position = Vector2(20, screen_size.y - game_over.size.y)
		
		ui_layer.add_child(game_over)
		
		await get_tree().create_timer(3).timeout
		
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
