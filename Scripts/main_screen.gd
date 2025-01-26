class_name MainPage
extends Node

@export var bubbleHealth = 1;
var timerStartTime:float = 10.0;

func _on_timer_timeout() -> void:
	bubbleHealth += 1;
	timerStartTime += 10;
	$Timer.start(timerStartTime)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn");


func _on_upgrade_key_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/upgrade_key.tscn");
