class_name MainScreen
extends Control

@export var numBubbles: float = 0.0;

@export var bubblesPerClick: int = 1;
var machineUnlocked: bool = false;
var babiesUnlocked: bool = false;
var gardenUnlocked: bool = false;
var factoryUnlocked: bool = false;
var gangstersUnlocked: bool = false;

var wandBaseCost: int = 20;
var machineBaseCost: int = 50;
var babyBaseCost: int = 100;
var factoryBaseCost: int = 250;
var gardenBaseCost: int = 750;
var handBaseCost: int = 50;
var gangstersBaseCost: int = 1500;

var wandLevel: int = Global.wandLevel;
var machineLevel: int = Global.machineLevel;
var babyLevel: int = Global.babyLevel;
var factoryLevel: int = Global.factoryLevel;
var gardenLevel: int = Global.gardenLevel;
var handLevel: int = Global.handLevel;
var gangsterLevel: int = Global.gangsterLevel;

## On scene load set the main text for the scene label and button
func _ready() -> void:
	
	numBubbles = Global.bubblesPopped;
	$BubbleButton.text = "";
	$Label.text = "Bubbles Popped: " + str(numBubbles);
	
	wandLevel = Global.wandLevel;
	machineLevel = Global.machineLevel;
	babyLevel = Global.babyLevel;
	factoryLevel = Global.factoryLevel;
	gardenLevel = Global.gardenLevel;
	handLevel = Global.handLevel;
	gangsterLevel = Global.gangsterLevel;

	bubblesPerClick = Global.bubblesPerClick;
	machineUnlocked = Global.machineUnlocked;
	babiesUnlocked = Global.babiesUnlocked;
	gardenUnlocked = Global.gardenUnlocked;
	factoryUnlocked = Global.factoryUnlocked;
	gangstersUnlocked = Global.gangstersUnlocked;

	if(wandLevel == 0):
		$Upgrades/WandButton.text = "(1) Bubble Wand";
	else:
		$Upgrades/WandButton.text = "(1) Bubble Wand (Level " + str(wandLevel) + ")";
		
	if(machineLevel == 0):
		$Upgrades/MachineButton.text = "(2) Bubble Machine";
	else:
		$Upgrades/MachineButton.text = "(2) Bubble Machine (Level " + str(machineLevel) + ")";
		
	if(handLevel == 0):
		$Upgrades/HandsButton.text = "(3) Extra Hands";
	else:
		$Upgrades/WandButton.text = "(3) Extra Hands (Level " + str(handLevel) + ")";
		
	if(babyLevel == 0):
		$Upgrades/BabyButton.text = "(5) Bubble Blowing Babies";
	else:
		$Upgrades/WandButton.text = "(5) Bubble Blowing Babies (Level " + str(babyLevel) + ")";
		
	if(factoryLevel == 0):
		$Upgrades/FactoryButton.text = "(4) Bubble Factory";
	else:
		$Upgrades/WandButton.text = "(4) Bubble Factory (Level " + str(factoryLevel) + ")";
		
	if(gardenLevel == 0):
		$Upgrades/GardenButton.text = "(6) Bubble Garden";
	else:
		$Upgrades/WandButton.text = "(6) Bubble Garden (Level " + str(gardenLevel) + ")";
		
	if(gangsterLevel == 0):
		$Upgrades/GangsterButton.text = "(7) Bubble Busters";
	else:
		$Upgrades/WandButton.text = "(7) Bubble Busters (Level " + str(gangsterLevel) + ")";

func _process(_delta: float) -> void:
	Global.bubblesPopped = numBubbles;
	
	Global.wandLevel = wandLevel;
	Global.machineLevel = machineLevel;
	Global.babyLevel = babyLevel;
	Global.factoryLevel = factoryLevel;
	Global.gardenLevel = gardenLevel;
	Global.handLevel = handLevel;
	Global.gangsterLevel = gangsterLevel;

	Global.bubblesPerClick = bubblesPerClick;
	Global.machineUnlocked = machineUnlocked;
	Global.babiesUnlocked = babiesUnlocked;
	Global.gardenUnlocked = gardenUnlocked;
	Global.factoryUnlocked = factoryUnlocked;
	Global.gangstersUnlocked = gangstersUnlocked;
	
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
	$BubbleButton/AudioStreamPlayer2D.play();
	numBubbles += bubblesPerClick;

func _on_bubble_button_mouse_entered() -> void:
	$BubbleButton.text = " (Space)     Click to Pop";

func _on_bubble_button_mouse_exited() -> void:
	$BubbleButton.text = "";

func _on_wand_button_pressed() -> void:
	if(numBubbles >= wandBaseCost):
		numBubbles -= wandBaseCost;
		bubblesPerClick += 1;
		wandLevel += 1;
		$Upgrades/WandButton.text = "(1) Bubble Wand (Level " + str(wandLevel) + ")";

func _on_wand_button_mouse_entered() -> void:
	$Upgrades/WandButton.text = "Cost to Upgrade: " + str(wandBaseCost) + " Bubbles";

func _on_wand_button_mouse_exited() -> void:
	if(bubblesPerClick > 1):
		$Upgrades/WandButton.text = "(1) Bubble Wand (Level " + str(wandLevel) + ")";
	else:
		$Upgrades/WandButton.text = "(1) Bubble Wand";
		
func _on_hands_button_pressed() -> void:
	if(numBubbles >= handBaseCost):
		numBubbles -= handBaseCost;
		bubblesPerClick += 1;
		handLevel += 1;
		$Upgrades/HandsButton.text = "Extra Hands (Level " + str(handLevel) + ")";

func _on_machine_button_pressed() -> void:
	if(!machineUnlocked and numBubbles >= machineBaseCost):
		numBubbles -= machineBaseCost;
		print("Machine Unlocked")
		machineUnlocked = true;
		machineLevel = 1;
		$Upgrades/MachineButton.text = "(2) Bubble Machine (Level " + str(machineLevel) + ")";
	else:
		machineLevel += 1;
		$Upgrades/MachineButton.text = "(2) Bubble Machine (Level " + str(machineLevel) + ")";

func _on_machine_button_mouse_entered() -> void:
	$Upgrades/MachineButton.text = "Cost to Upgrade: " + str(machineBaseCost) + " Bubbles";

func _on_machine_button_mouse_exited() -> void:
	if(machineUnlocked):
		$Upgrades/MachineButton.text = "(2) Bubble Machine (Level " + str(machineLevel) + ")";
	else:
		$Upgrades/MachineButton.text = "(2) Bubble Machine"

func _on_factory_button_pressed() -> void:
	if(!factoryUnlocked and numBubbles >= factoryBaseCost):
		numBubbles -= factoryBaseCost;
		print("Factory Unlocked")
		factoryUnlocked = true;
		factoryLevel += 1;
		$Upgrades/FactoryButton.text = "(4) Bubble Factory (Level " + str(factoryLevel) + ")";
	else:
		factoryLevel += 1;
		$Upgrades/FactoryButton.text = "(4) Bubble Factory (Level " + str(factoryLevel) + ")";

func _on_baby_button_pressed() -> void:
	if(!babiesUnlocked and numBubbles >= babyBaseCost):
		numBubbles -= babyBaseCost;
		print("Babies Unlocked")
		babiesUnlocked = true;
		babyLevel += 1;
		$Upgrades/BabyButton.text = "(5) Bubble Babies (Level " + str(babyLevel) + ")";
	else:
		Global.babyLevel += 1;
		$Upgrades/BabyButton.text = "(5) Bubble Babies (Level " + str(babyLevel) + ")";
		
func _on_garden_button_pressed() -> void:
	if(!gardenUnlocked and numBubbles >= gardenBaseCost):
		numBubbles -= gardenBaseCost;
		print("Garden Unlocked")
		gardenUnlocked = true;
		gardenLevel += 1;
		$Upgrades/GardenButton.text = "(6) Bubble Garden (Level " + str(gardenLevel) + ")";
	else:
		gardenLevel += 1;
		$Upgrades/GardenButton.text = "(6) Bubble Garden (Level " + str(gardenLevel) + ")";

func _on_gangster_button_pressed() -> void:
	if(!gangstersUnlocked and numBubbles >= gangstersBaseCost):
		numBubbles -= gangstersBaseCost;
		print("Gangsters Unlocked")
		gangstersUnlocked = true;
		gangsterLevel += 1;
		$Upgrades/GangsterButton.text = "(7) Bubble Gangsters (Level " + str(gangsterLevel) + ")";
	else:
		gangsterLevel += 1;
		$Upgrades/GangsterButton.text = "(7) Bubble Gangsters (Level " + str(gangsterLevel) + ")";


func _on_hands_button_mouse_entered() -> void:
	$Upgrades/HandsButton.text = "Cost to Upgrade: " + str(handBaseCost) + " Bubbles";


func _on_hands_button_mouse_exited() -> void:
	if(Global.handLevel > 1):
		$Upgrades/HandsButton.text = "(3) Extra Hands (Level " + str(handLevel) + ")";
	else:
		$Upgrades/HandsButton.text = "(3) Extra Hands";


func _on_factory_button_mouse_entered() -> void:
	$Upgrades/FactoryButton.text = "Cost to Upgrade: " + str(factoryBaseCost) + " Bubbles";


func _on_factory_button_mouse_exited() -> void:
	if(factoryUnlocked):
		$Upgrades/FactoryButton.text = "(4) Bubble Factory (Level " + str(factoryLevel) + ")";
	else:
		$Upgrades/FactoryButton.text = "(4) Bubble Factory";


func _on_baby_button_mouse_entered() -> void:
	$Upgrades/BabyButton.text = "Cost to Upgrade: " + str(babyBaseCost) + " Bubbles";


func _on_baby_button_mouse_exited() -> void:
	if(babiesUnlocked):
		$Upgrades/BabyButton.text = "(5) Bubble Blowing Babies (Level " + str(babyLevel) + ")";
	else:
		$Upgrades/BabyButton.text = "(5) Bubble Blowing Babies";


func _on_garden_button_mouse_entered() -> void:
	$Upgrades/GardenButton.text = "Cost to Upgrade: " + str(gardenBaseCost) + " Bubbles";


func _on_garden_button_mouse_exited() -> void:
	if(gardenUnlocked):
		$Upgrades/GardenButton.text = "(6) Bubble Garden (Level " + str(gardenLevel) + ")";
	else:
		$Upgrades/GardenButton.text = "(6) Bubble Garden";

func _on_gangster_button_mouse_entered() -> void:
	$Upgrades/GangsterButton.text = "Cost to Upgrade: " + str(gangstersBaseCost) + " Bubbles";

func _on_gangster_button_mouse_exited() -> void:
	if(gangstersUnlocked):
		$Upgrades/GangsterButton.text = "(7) Bubble Busters (Level " + str(gangsterLevel) + ")";
	else:
		$Upgrades/GangsterButton.text = "(7) Bubble Busters";
