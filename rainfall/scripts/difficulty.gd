extends Control

func _on_light_rain_button_pressed():
	GameData.set_difficulty("light")
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
func _on_heavy_rain_button_pressed():
	GameData.set_difficulty("heavy")
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_storm_button_pressed():
	GameData.set_difficulty("storm")
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
