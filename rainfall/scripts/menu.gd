extends Control

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/difficulty.tscn")

func _on_instructions_button_pressed():
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
