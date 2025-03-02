class_name UI
extends Control

@export var numBubbles: float = 0.0;
@export var bubblesPerClick: int = 1;
@export var bubbleMaxHealth: int = 1;
@export var bubbleCurrentHealth: int = bubbleMaxHealth;

var bubbleIcon = preload("res://Assets/MainBubble.png");

var machineUnlocked: bool = false;
var babiesUnlocked: bool = false;
var gardenUnlocked: bool = false;
var factoryUnlocked: bool = false;
var gangstersUnlocked: bool = false;
var bubbleBusterAchievementUnlocked: bool = false;
var superBubbleBusterAchievementUnlocked: bool = false;
var ultimateBubbleBusterAchievementUnlocked: bool = false;

var wandCost: int = 20;
var machineCost: int = 50;
var babyCost: int = 100;
var factoryCost: int = 250;
var gardenCost: int = 750;
var handCost: int = 50;
var gangstersCost: int = 1500;

var wandLevel: int = 0;
var machineLevel: int = 0;
var babyLevel: int = 0;
var factoryLevel: int = 0;
var gardenLevel: int = 0;
var handLevel: int = 0;
var gangstersLevel: int = 0;

signal specialScene;

## On scene load set the main text for the scene label and button
func _ready() -> void:
	
	numBubbles = Global.bubblesPopped;
	bubbleCurrentHealth = Global.bubbleCurrentHealth;
	bubbleMaxHealth = Global.bubbleMaxHealth
	
	$Timer.wait_time = Global.timeRemaining;
	$Timer.start();
	
	$BubbleButton.text = "";
	$BubbleCount.text = "Bubbles Popped: " + str(numBubbles);
	$BubbleButton/HealthBar.max_value = bubbleMaxHealth;
	$BubbleButton/HealthBar.value = bubbleCurrentHealth;
	
	wandLevel = Global.wandLevel;
	machineLevel = Global.machineLevel;
	babyLevel = Global.babyLevel;
	factoryLevel = Global.factoryLevel;
	gardenLevel = Global.gardenLevel;
	handLevel = Global.handLevel;
	gangstersLevel = Global.gangstersLevel;

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
		$Upgrades/HandsButton.text = "(3) Extra Hands (Level " + str(handLevel) + ")";
		
	if(babyLevel == 0):
		$Upgrades/BabyButton.text = "(5) Bubble Blowing Babies";
	else:
		$Upgrades/BabyButton.text = "(5) Bubble Blowing Babies (Level " + str(babyLevel) + ")";
		
	if(factoryLevel == 0):
		$Upgrades/FactoryButton.text = "(4) Bubble Factory";
	else:
		$Upgrades/FactoryButton.text = "(4) Bubble Factory (Level " + str(factoryLevel) + ")";
		
	if(gardenLevel == 0):
		$Upgrades/GardenButton.text = "(6) Bubble Garden";
	else:
		$Upgrades/GardenButton.text = "(6) Bubble Garden (Level " + str(gardenLevel) + ")";
		
	if(gangstersLevel == 0):
		$Upgrades/GangsterButton.text = "(7) Bubble Busters";
	else:
		$Upgrades/GangsterButton.text = "(7) Bubble Busters (Level " + str(gangstersLevel) + ")";

func _process(_delta: float) -> void:
	$BubbleCount.text = "Bubbles Popped: " + str(round(numBubbles));
	$Timer/TimeLeft.text = "Time Left: " + str(round($Timer.time_left));
	$BubbleButton/HealthBar.max_value = bubbleMaxHealth;
	$BubbleButton/HealthBar.value = bubbleCurrentHealth;
	
	if(machineUnlocked):
		if(factoryUnlocked):
			if(babiesUnlocked):
				if(gardenUnlocked):
					if(gangstersUnlocked):
						numBubbles += 0.5 * (machineLevel + factoryLevel + 
						babyLevel + gardenLevel + gangstersLevel) * _delta;
					else:
						numBubbles += 0.5 + (machineLevel + factoryLevel + 
						babyLevel + gardenLevel) * _delta;
				else:
					numBubbles += 0.5 * (machineLevel + factoryLevel +
					babyLevel) * _delta;
		else:
			numBubbles += 0.5 * (machineLevel + factoryLevel) * _delta;
		numBubbles += 0.5 * machineLevel * _delta;
		
	if(machineLevel >= 5):
		$Upgrades/FactoryButton.visible = true;
	if(factoryLevel >= 5):
		$Upgrades/BabyButton.visible = true;
	if(babyLevel >= 5):
		$Upgrades/GardenButton.visible = true;
	if(gardenLevel >= 5):
		$Upgrades/GangsterButton.visible = true;
	if(wandLevel >= 5):
		$Upgrades/HandsButton.visible = true;	
	
	if(babiesUnlocked and gardenUnlocked and factoryUnlocked and machineUnlocked and gangstersUnlocked):
		if(wandLevel >= 10 and machineLevel >= 10 and handLevel >= 10 and babyLevel >= 10 and 
		factoryLevel >= 10 and gardenLevel >= 10 and gangstersLevel >= 10 and !ultimateBubbleBusterAchievementUnlocked):
			ultimateBubbleBusterAchievementUnlocked = true;
			$Achievement.visible = true;
			$Achievement.text = "ACHIEVEMENT UNLOCKED: The Ultimate Bubble Buster \t";
			var timer = get_tree().create_timer(3);
			await timer.timeout;
			$Achievement.visible = false;
		elif(wandLevel >= 5 and machineLevel >= 5 and handLevel >= 5 and babyLevel >= 5 and 
		factoryLevel >= 5 and gardenLevel >= 5 and gangstersLevel >= 5 and !superBubbleBusterAchievementUnlocked):
			superBubbleBusterAchievementUnlocked = true;
			$Achievement.visible = true;
			$Achievement.text = "ACHIEVEMENT UNLOCKED: Super Bubble Buster \t";
			var timer = get_tree().create_timer(3);
			await timer.timeout;
			$Achievement.visible = false;
		elif(!bubbleBusterAchievementUnlocked):
			bubbleBusterAchievementUnlocked = true;
			$Achievement.visible = true;
			$Achievement.text = "ACHIEVEMENT UNLOCKED: Bubble Buster \t";
			var timer = get_tree().create_timer(3);
			await timer.timeout;
			$Achievement.visible = false;

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("addBubbles")):
		numBubbles += 1000000;

func _on_bubble_button_pressed() -> void:
	$BubbleButton/AudioStreamPlayer2D.play();
	bubbleCurrentHealth -= bubblesPerClick;
	if(bubbleCurrentHealth <= 0):
		numBubbles += bubblesPerClick;
		bubbleCurrentHealth = bubbleMaxHealth;
		$BubbleButton.icon = null;
		var timer = get_tree().create_timer(.02);
		await timer.timeout;
		$BubbleButton.icon = bubbleIcon;

func _on_bubble_button_mouse_entered() -> void:
	$BubbleButton.text = " (B)     Click to Pop";

func _on_bubble_button_mouse_exited() -> void:
	$BubbleButton.text = "";

func _on_wand_button_pressed() -> void:
	if(numBubbles >= wandCost):
		numBubbles -= wandCost;
		bubblesPerClick += 1;
		wandLevel += 1;
		@warning_ignore("narrowing_conversion")
		wandCost *= 1.5;
		$Upgrades/WandButton.text = "(1) Bubble Wand (Level " + str(wandLevel) + ")";
		if(wandLevel == 5):
			$Achievement.visible = true;
			$Achievement.text = "ACHIEVEMENT UNLOCKED: Student of the Wand \t";
			var timer = get_tree().create_timer(3);
			await timer.timeout;
			$Achievement.visible = false;

func _on_wand_button_mouse_entered() -> void:
	$Upgrades/WandButton.text = "Cost to Upgrade: " + str(wandCost) + " Bubbles";

func _on_wand_button_mouse_exited() -> void:
	if(wandLevel >= 1):
		$Upgrades/WandButton.text = "(1) Bubble Wand (Level " + str(wandLevel) + ")";
	else:
		$Upgrades/WandButton.text = "(1) Bubble Wand";
		
func _on_hands_button_pressed() -> void:
	if(numBubbles >= handCost):
		numBubbles -= handCost;
		bubblesPerClick += 1;
		handLevel += 1;
		@warning_ignore("narrowing_conversion")
		handCost *= 1.5;
		$Upgrades/HandsButton.text = "(3) Extra Hands (Level " + str(handLevel) + ")";
	if(handLevel == 5):
			$Achievement.visible = true;
			$Achievement.text = "ACHIEVEMENT UNLOCKED: Popping Hands \t";
			var timer = get_tree().create_timer(3);
			await timer.timeout;
			$Achievement.visible = false;

func _on_machine_button_pressed() -> void:
	if(!machineUnlocked and numBubbles >= machineCost):
		numBubbles -= machineCost;
		print("Machine Unlocked")
		machineUnlocked = true;
		machineLevel = 1;
		@warning_ignore("narrowing_conversion")
		machineCost *= 1.5;
		$Upgrades/MachineButton.text = "(2) Bubble Machine (Level " + str(machineLevel) + ")";
	elif(numBubbles >= machineCost):
		numBubbles -= machineCost;
		@warning_ignore("standalone_expression")
		machineCost *+ 1.5;
		machineLevel += 1;
		$Upgrades/MachineButton.text = "(2) Bubble Machine (Level " + str(machineLevel) + ")";
	if(machineLevel == 5):
			$Achievement.visible = true;
			$Achievement.text = "ACHIEVEMENT UNLOCKED: Bubble Producer \t";
			var timer = get_tree().create_timer(3);
			await timer.timeout;
			$Achievement.visible = false;

func _on_machine_button_mouse_entered() -> void:
	$Upgrades/MachineButton.text = "Cost to Upgrade: " + str(machineCost) + " Bubbles";

func _on_machine_button_mouse_exited() -> void:
	if(machineUnlocked):
		$Upgrades/MachineButton.text = "(2) Bubble Machine (Level " + str(machineLevel) + ")";
	else:
		$Upgrades/MachineButton.text = "(2) Bubble Machine"

func _on_factory_button_pressed() -> void:
	if(!factoryUnlocked and numBubbles >= factoryCost):
		numBubbles -= factoryCost;
		print("Factory Unlocked")
		factoryUnlocked = true;
		factoryLevel += 1;
		@warning_ignore("narrowing_conversion")
		factoryCost *= 1.5;
		$Upgrades/FactoryButton.text = "(4) Bubble Factory (Level " + str(factoryLevel) + ")";
	elif(numBubbles >= factoryCost):
		numBubbles -= factoryCost;
		@warning_ignore("narrowing_conversion")
		factoryCost *= 1.5;
		factoryLevel += 1;
		$Upgrades/FactoryButton.text = "(4) Bubble Factory (Level " + str(factoryLevel) + ")";
	if(factoryLevel == 5):
			$Achievement.visible = true;
			$Achievement.text = "ACHIEVEMENT UNLOCKED: Bubble Factorial! \t";
			var timer = get_tree().create_timer(3);
			await timer.timeout;
			$Achievement.visible = false;

func _on_baby_button_pressed() -> void:
	if(!babiesUnlocked and numBubbles >= babyCost):
		numBubbles -= babyCost;
		print("Babies Unlocked")
		babiesUnlocked = true;
		babyLevel += 1;
		@warning_ignore("narrowing_conversion")
		babyCost *= 1.5;
		$Upgrades/BabyButton.text = "(5) Bubble Babies (Level " + str(babyLevel) + ")";
	elif(numBubbles >= babyCost):
		numBubbles -= babyCost;
		@warning_ignore("narrowing_conversion")
		babyCost *= 1.5;
		babyLevel += 1;
		$Upgrades/BabyButton.text = "(5) Bubble Babies (Level " + str(babyLevel) + ")";
	if(babyLevel == 5):
			$Achievement.visible = true;
			$Achievement.text = "ACHIEVEMENT UNLOCKED: Baby's First Bubble \t";
			var timer = get_tree().create_timer(3);
			await timer.timeout;
			$Achievement.visible = false;
		
func _on_garden_button_pressed() -> void:
	if(!gardenUnlocked and numBubbles >= gardenCost):
		numBubbles -= gardenCost;
		print("Garden Unlocked")
		gardenUnlocked = true;
		gardenLevel += 1;
		@warning_ignore("narrowing_conversion")
		gardenCost *= 1.5;
		$Upgrades/GardenButton.text = "(6) Bubble Garden (Level " + str(gardenLevel) + ")";
	elif(numBubbles >= gardenCost):
		numBubbles -= gardenCost;
		gardenLevel += 1;
		@warning_ignore("narrowing_conversion")
		gardenCost *= 1.5;
		$Upgrades/GardenButton.text = "(6) Bubble Garden (Level " + str(gardenLevel) + ")";
	if(gardenLevel == 5):
			$Achievement.visible = true;
			$Achievement.text = "ACHIEVEMENT UNLOCKED: Bubble Botanist \t";
			var timer = get_tree().create_timer(3);
			await timer.timeout;
			$Achievement.visible = false;

func _on_gangster_button_pressed() -> void:
	if(!gangstersUnlocked and numBubbles >= gangstersCost):
		numBubbles -= gangstersCost;
		print("Gangsters Unlocked")
		gangstersUnlocked = true;
		gangstersLevel += 1;
		@warning_ignore("narrowing_conversion")
		gangstersCost *= 1.5;
		$Upgrades/GangsterButton.text = "(7) Bubble Busters (Level " + str(gangstersLevel) + ")";
	elif(numBubbles >= gangstersCost):
		numBubbles -= gangstersCost;
		gangstersLevel += 1;
		@warning_ignore("narrowing_conversion")
		gangstersCost *= 1.5;
		$Upgrades/GangsterButton.text = "(7) Bubble Busters (Level " + str(gangstersLevel) + ")";
	if(gangstersLevel == 5):
			$Achievement.visible = true;
			$Achievement.text = "ACHIEVEMENT UNLOCKED: Bubble Destroyer \t";
			var timer = get_tree().create_timer(3);
			await timer.timeout;
			$Achievement.visible = false;

func _on_hands_button_mouse_entered() -> void:
	$Upgrades/HandsButton.text = "Cost to Upgrade: " + str(handCost) + " Bubbles";

func _on_hands_button_mouse_exited() -> void:
	if(handLevel >= 1):
		$Upgrades/HandsButton.text = "(3) Extra Hands (Level " + str(handLevel) + ")";
	else:
		$Upgrades/HandsButton.text = "(3) Extra Hands";

func _on_factory_button_mouse_entered() -> void:
	$Upgrades/FactoryButton.text = "Cost to Upgrade: " + str(factoryCost) + " Bubbles";

func _on_factory_button_mouse_exited() -> void:
	if(factoryUnlocked):
		$Upgrades/FactoryButton.text = "(4) Bubble Factory (Level " + str(factoryLevel) + ")";
	else:
		$Upgrades/FactoryButton.text = "(4) Bubble Factory";

func _on_baby_button_mouse_entered() -> void:
	$Upgrades/BabyButton.text = "Cost to Upgrade: " + str(babyCost) + " Bubbles";

func _on_baby_button_mouse_exited() -> void:
	if(babiesUnlocked):
		$Upgrades/BabyButton.text = "(5) Bubble Blowing Babies (Level " + str(babyLevel) + ")";
	else:
		$Upgrades/BabyButton.text = "(5) Bubble Blowing Babies";

func _on_garden_button_mouse_entered() -> void:
	$Upgrades/GardenButton.text = "Cost to Upgrade: " + str(gardenCost) + " Bubbles";

func _on_garden_button_mouse_exited() -> void:
	if(gardenUnlocked):
		$Upgrades/GardenButton.text = "(6) Bubble Garden (Level " + str(gardenLevel) + ")";
	else:
		$Upgrades/GardenButton.text = "(6) Bubble Garden";

func _on_gangster_button_mouse_entered() -> void:
	$Upgrades/GangsterButton.text = "Cost to Upgrade: " + str(gangstersCost) + " Bubbles";

func _on_gangster_button_mouse_exited() -> void:
	if(gangstersUnlocked):
		$Upgrades/GangsterButton.text = "(7) Bubble Busters (Level " + str(gangstersLevel) + ")";
	else:
		$Upgrades/GangsterButton.text = "(7) Bubble Busters";

func save_data():
	Global.bubbleMaxHealth = bubbleMaxHealth;
	Global.bubbleCurrentHealth = bubbleCurrentHealth;
	
	Global.timeRemaining = $Timer.time_left;
	
	Global.bubblesPopped = numBubbles;
	
	Global.wandLevel = wandLevel;
	Global.machineLevel = machineLevel;
	Global.babyLevel = babyLevel;
	Global.factoryLevel = factoryLevel;
	Global.gardenLevel = gardenLevel;
	Global.handLevel = handLevel;
	Global.gangstersLevel = gangstersLevel;

	Global.bubblesPerClick = bubblesPerClick;
	Global.machineUnlocked = machineUnlocked;
	Global.babiesUnlocked = babiesUnlocked;
	Global.gardenUnlocked = gardenUnlocked;
	Global.factoryUnlocked = factoryUnlocked;
	Global.gangstersUnlocked = gangstersUnlocked;

func _on_main_save() -> void:
	save_data();

func _on_timer_timeout() -> void:
	bubbleMaxHealth += 1;
