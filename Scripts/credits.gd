class_name Credits
extends Control


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_screen.tscn");
