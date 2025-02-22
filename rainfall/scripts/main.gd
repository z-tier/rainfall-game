extends Node

var lightning_scene = preload("res://scenes/lightning.tscn")
var stopwatch = preload("res://scenes/stopwatch.tscn")
var stopwatchTime

func _ready():
	var lightning = lightning_scene.instantiate()  
	add_child(lightning)
	lightning.z_index = 10
	
	if stopwatch:
		stopwatchTime = stopwatch.instantiate()
		
		if stopwatchTime == null:
			print("stopwatch not instanced")
		else:
			print("stopwatch instanced")
			
		add_child(stopwatchTime)
		stopwatchTime.visible = true

func disable_stopwatch():   
	var stopwatchPanel = stopwatchTime.get_child(0)
	if stopwatchPanel:
		stopwatchPanel.set_process(false)
		print("stopwatch dead")
	else:
		print("stopwatch alive")
