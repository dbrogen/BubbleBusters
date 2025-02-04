class_name MainScreen
extends Node

var redWand = preload("res://Assets/BubbleWands/bubblewand_red.png");

signal save;

func _ready() -> void:
	print("Time Remaining: " + str(Global.timeRemaining));
	var timeLeft = Global.timeRemaining;
	$Timer.wait_time = timeLeft;
	$Timer.start();

func _process(_delta: float) -> void:
	$Timer/TimeLeft.text = "Time Left: " + str(round($Timer.time_left));

func _on_credits_pressed() -> void:
	save.emit();
	print("Time Remaining for the Timer: " + str(round($Timer.time_left)));
	Global.timeRemaining = $Timer.time_left;
	get_tree().change_scene_to_file("res://Scenes/credits.tscn");

func _on_upgrade_key_pressed() -> void:
	save.emit();
	print("Time Remaining for the Timer: " + str(round($Timer.time_left)));
	Global.timeRemaining = $Timer.time_left;
	get_tree().change_scene_to_file("res://Scenes/upgrade_key.tscn");

func _on_ui_wand_achievement() -> void:
	$Achievement.visible = true;
	$Achievement.text = "ACHIEVEMENT UNLOCKED: Student of the Wand \t";
	var timer = get_tree().create_timer(5);
	await timer.timeout;
	$Achievement.visible = false;
