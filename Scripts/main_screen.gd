class_name MainScreen
extends Node

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn");


func _on_upgrade_key_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/upgrade_key.tscn");
