class_name MainScreen
extends Control

@export var bubbleHealth: int = 0;
@export var numBubbles: float = 0.0;
var bubblesPerClick: int = 1;
var machineUnlocked: bool = false;
var babiesUnlocked: bool = false;
var gardenUnlocked: bool = false;
var factoryUnlocked: bool = false;
var gangstersUnlocked: bool = false;

## On scene load set the main text for the scene label and button
func _ready() -> void:
	$BubbleButton.text = "";
	$Label.text = "Bubbles Popped: " + str(numBubbles);
	$Upgrades/WandButton.text = "(1) Bubble Wand";
	$Upgrades/MachineButton.text = "(2) Bubble Machine";
	$Upgrades/BabyButton.text = "(5) Bubble Blowing Babies";
	$Upgrades/FactoryButton.text = "(4) Bubble Factory";
	$Upgrades/GardenButton.text = "(6) Bubble Garden";
	$Upgrades/HandsButton.text = "(3) Extra Hands";
	$Upgrades/GangsterButton.text = "(7) Bubble Busters";
	bubbleHealth = get_parent().bubbleHealth;

func _process(_delta: float) -> void:
	$Label.text = "Bubbles Popped: " + str(round(numBubbles));
	if(machineUnlocked):
		if(factoryUnlocked):
			if(babiesUnlocked):
				if(gardenUnlocked):
					if(gangstersUnlocked):
						numBubbles += 0.5 * (Global.machineLevel * Global.factoryLevel * 
						Global.babyLevel * Global.gardenLevel * Global. gangsterLevel * _delta);
					else:
						numBubbles += 0.5 * (Global.machineLevel * Global.factoryLevel * 
						Global.babyLevel * Global.gardenLevel * _delta);
				else:
					numBubbles += 0.5 * (Global.machineLevel * Global.factoryLevel * 
					Global.babyLevel * _delta);
		else:
			numBubbles += 0.5 * (Global.machineLevel * Global.factoryLevel * _delta);
		numBubbles += 0.5 * Global.machineLevel * _delta;
		
	if(Global.machineLevel >= 5):
		$Upgrades/BabyButton.visible = true;
		$Upgrades/FactoryButton.visible = true;
	if(Global.factoryLevel >= 5):
		$Upgrades/GardenButton.visible = true;
	if(Global.gardenLevel >= 5):
		$Upgrades/GangsterButton.visible = true;
	if(Global.wandLevel >= 5):
		$Upgrades/HandsButton.visible = true;
	

func _on_bubble_button_pressed() -> void:
	bubbleHealth -= bubblesPerClick;
	$BubbleButton/AudioStreamPlayer2D.play();
	if(bubbleHealth <= 0):
		numBubbles += 1;
		bubbleHealth = get_parent().bubbleHealth;

func _on_bubble_button_mouse_entered() -> void:
	$BubbleButton.text = " (Space)     Click to Pop";

func _on_bubble_button_mouse_exited() -> void:
	$BubbleButton.text = "";

func _on_wand_button_pressed() -> void:
	bubblesPerClick += 1;
	Global.wandLevel += 1;
	$Upgrades/WandButton.text = "(1) Bubble Wand (Level " + str(Global.wandLevel) + ")";

func _on_wand_button_mouse_entered() -> void:
	$Upgrades/WandButton.text = "This increases the amount of bubbles popped per click";

func _on_wand_button_mouse_exited() -> void:
	if(bubblesPerClick > 1):
		$Upgrades/WandButton.text = "(1) Bubble Wand (Level " + str(Global.wandLevel) + ")";
	else:
		$Upgrades/WandButton.text = "(1) Bubble Wand";
		
func _on_hands_button_pressed() -> void:
	bubblesPerClick += 1;
	Global.handLevel += 1;
	$Upgrades/HandsButton.text = "Extra Hands (Level " + str(Global.handLevel) + ")";

func _on_machine_button_pressed() -> void:
	if(!machineUnlocked):
		print("Machine Unlocked")
		machineUnlocked = true;
		Global.machineLevel = 1;
		$Upgrades/MachineButton.text = "(2) Bubble Machine (Level " + str(Global.machineLevel) + ")";
	else:
		Global.machineLevel += 1;
		$Upgrades/MachineButton.text = "(2) Bubble Machine (Level " + str(Global.machineLevel) + ")";

func _on_machine_button_mouse_entered() -> void:
	$Upgrades/MachineButton.text = "This passively pops bubbles";

func _on_machine_button_mouse_exited() -> void:
	if(machineUnlocked):
		$Upgrades/MachineButton.text = "(2) Bubble Machine (Level " + str(Global.machineLevel) + ")";
	else:
		$Upgrades/MachineButton.text = "(2) Bubble Machine"

func _on_factory_button_pressed() -> void:
	if(!factoryUnlocked):
		print("Factory Unlocked")
		factoryUnlocked = true;
		Global.factoryLevel += 1;
		$Upgrades/FactoryButton.text = "(4) Bubble Factory (Level " + str(Global.factoryLevel) + ")";
	else:
		Global.factoryLevel += 1;
		$Upgrades/FactoryButton.text = "(4) Bubble Factory (Level " + str(Global.factoryLevel) + ")";

func _on_baby_button_pressed() -> void:
	if(!babiesUnlocked):
		print("Babies Unlocked")
		babiesUnlocked = true;
		Global.babyLevel += 1;
		$Upgrades/BabyButton.text = "(5) Bubble Babies (Level " + str(Global.babyLevel) + ")";
	else:
		Global.babyLevel += 1;
		$Upgrades/BabyButton.text = "(5) Bubble Babies (Level " + str(Global.babyLevel) + ")";
		
func _on_garden_button_pressed() -> void:
	if(!gardenUnlocked):
		print("Garden Unlocked")
		gardenUnlocked = true;
		Global.gardenLevel += 1;
		$Upgrades/GardenButton.text = "(6) Bubble Garden (Level " + str(Global.gardenLevel) + ")";
	else:
		Global.gardenLevel += 1;
		$Upgrades/GardenButton.text = "(6) Bubble Garden (Level " + str(Global.gardenLevel) + ")";

func _on_gangster_button_pressed() -> void:
	if(!gangstersUnlocked):
		print("Gangsters Unlocked")
		gangstersUnlocked = true;
		Global.gangsterLevel += 1;
		$Upgrades/GangsterButton.text = "(7) Bubble Gangsters (Level " + str(Global.gangsterLevel) + ")";
	else:
		Global.gangsterLevel += 1;
		$Upgrades/GangsterButton.text = "(7) Bubble Gangsters (Level " + str(Global.gangsterLevel) + ")";


func _on_hands_button_mouse_entered() -> void:
	$Upgrades/HandsButton.text = "This increases the amount of bubbles popped per click";


func _on_hands_button_mouse_exited() -> void:
	if(Global.handLevel > 1):
		$Upgrades/HandsButton.text = "(3) Extra Hands (Level " + str(Global.handLevel) + ")";
	else:
		$Upgrades/HandsButton.text = "(3) Extra Hands";


func _on_factory_button_mouse_entered() -> void:
	$Upgrades/FactoryButton.text = "We will continue our push into auto-popping bubble science. Let’s get some factories going!";


func _on_factory_button_mouse_exited() -> void:
	if(factoryUnlocked):
		$Upgrades/FactoryButton.text = "(4) Bubble Factory (Level " + str(Global.factoryLevel) + ")";
	else:
		$Upgrades/FactoryButton.text = "(4) Bubble Factory";


func _on_baby_button_mouse_entered() -> void:
	$Upgrades/BabyButton.text = "Babies love to blow bubbles. Why don't we capitalize on this?";


func _on_baby_button_mouse_exited() -> void:
	if(babiesUnlocked):
		$Upgrades/BabyButton.text = "(5) Bubble Blowing Babies (Level " + str(Global.babyLevel) + ")";
	else:
		$Upgrades/BabyButton.text = "(5) Bubble Blowing Babies";


func _on_garden_button_mouse_entered() -> void:
	$Upgrades/GardenButton.text = "Planting bubbles seems to grow more! Then, we can pop them.";


func _on_garden_button_mouse_exited() -> void:
	if(gardenUnlocked):
		$Upgrades/GardenButton.text = "(6) Bubble Garden (Level " + str(Global.gardenLevel) + ")";
	else:
		$Upgrades/GardenButton.text = "(6) Bubble Garden";

func _on_gangster_button_mouse_entered() -> void:
	$Upgrades/GangsterButton.text = "Babies like to pop bubbles lets teach them how to be Bubble Busters.";

func _on_gangster_button_mouse_exited() -> void:
	if(gangstersUnlocked):
		$Upgrades/GangsterButton.text = "(7) Bubble Busters (Level " + str(Global.gangsterLevel) + ")";
	else:
		$Upgrades/GangsterButton.text = "(7) Bubble Busters";
