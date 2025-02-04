class_name MainScreen
extends Node

var redWand = preload("res://Assets/BubbleWands/bubblewand_red.png");

signal save;

func _on_credits_pressed() -> void:
	save.emit();
	get_tree().change_scene_to_file("res://Scenes/credits.tscn");

func _on_upgrade_key_pressed() -> void:
	save.emit();
	get_tree().change_scene_to_file("res://Scenes/upgrade_key.tscn");
