class_name Background
extends TextureRect

var startY1;
var startY2;
var startY3;
var startY4;
var startY5;
var startY6;
var startY7;
var startY8;
var startY9;
var startY10;
var startY11;
var startY12;
var startY13;
var startY14;
var startY15;
var startY16;
var startY17;
var startY18;
var startY19;
var startY20;
var startY21;
var startY22;
var startY23;
var startY24;
var startY25;
var startY26;
var startY27;


func _ready():
	saveBubblePositions();
	startAnimations();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	moveBubbles(delta);


func saveBubblePositions():
	startY1 = $Bubble1.position.y;
	startY2 = $Bubble2.position.y;
	startY3 = $Bubble3.position.y;
	startY4 = $Bubble4.position.y;
	startY5 = $Bubble5.position.y;
	startY6 = $Bubble6.position.y;
	startY7 = $Bubble7.position.y;
	startY8 = $Bubble8.position.y;
	startY9 = $Bubble9.position.y;
	startY10 = $Bubble10.position.y;
	startY11 = $Bubble11.position.y;
	startY12 = $Bubble12.position.y;
	startY13 = $Bubble13.position.y;
	startY14 = $Bubble14.position.y;
	startY15 = $Bubble15.position.y;
	startY16 = $Bubble16.position.y;
	startY17 = $Bubble17.position.y;
	startY18 = $Bubble18.position.y;
	startY19 = $Bubble19.position.y;
	startY20 = $Bubble20.position.y;
	startY21 = $Bubble21.position.y;
	startY22 = $Bubble22.position.y;
	startY23 = $Bubble23.position.y;
	startY24 = $Bubble24.position.y;
	startY25 = $Bubble25.position.y;
	startY26 = $Bubble26.position.y;
	startY27 = $Bubble27.position.y;
	
func startAnimations():
	$Bubble1/BubbleSprite1.play("Popping");
	$Bubble2/BubbleSprite2.play("Popping");
	$Bubble3/BubbleSprite3.play("Popping");
	$Bubble4/BubbleSprite4.play("Popping");
	$Bubble5/BubbleSprite5.play("Popping");
	$Bubble6/BubbleSprite6.play("Popping");
	$Bubble7/BubbleSprite7.play("Popping");
	$Bubble8/BubbleSprite8.play("Popping");
	$Bubble9/BubbleSprite9.play("Popping");
	$Bubble10/BubbleSprite10.play("Popping");
	$Bubble11/BubbleSprite11.play("Popping");
	$Bubble12/BubbleSprite12.play("Popping");
	$Bubble13/BubbleSprite13.play("Popping");
	$Bubble14/BubbleSprite14.play("Popping");
	$Bubble15/BubbleSprite15.play("Popping");
	$Bubble16/BubbleSprite16.play("Popping");
	$Bubble17/BubbleSprite17.play("Popping");
	$Bubble18/BubbleSprite18.play("Popping");
	$Bubble19/BubbleSprite19.play("Popping");
	$Bubble20/BubbleSprite20.play("Popping");
	$Bubble21/BubbleSprite21.play("Popping");
	$Bubble22/BubbleSprite22.play("Popping");
	$Bubble23/BubbleSprite23.play("Popping");
	$Bubble24/BubbleSprite24.play("Popping");
	$Bubble25/BubbleSprite25.play("Popping");
	$Bubble26/BubbleSprite26.play("Popping");
	$Bubble27/BubbleSprite27.play("Popping");

func moveBubbles(delta: float):
	$Bubble1.position = Vector2($Bubble1.position.x + randf_range(-5,5) * delta, $Bubble1.position.y - randf_range(10,50) * delta);
	$Bubble2.position = Vector2($Bubble2.position.x + randf_range(-5,5) * delta, $Bubble2.position.y - randf_range(10,50) * delta);
	$Bubble3.position = Vector2($Bubble3.position.x + randf_range(-5,5) * delta, $Bubble3.position.y - randf_range(10,50) * delta);
	$Bubble4.position = Vector2($Bubble4.position.x + randf_range(-5,5) * delta, $Bubble4.position.y - randf_range(10,50) * delta);
	$Bubble5.position = Vector2($Bubble5.position.x + randf_range(-5,5) * delta, $Bubble5.position.y - randf_range(10,50) * delta);
	$Bubble6.position = Vector2($Bubble6.position.x + randf_range(-5,5) * delta, $Bubble6.position.y - randf_range(10,50) * delta);
	$Bubble7.position = Vector2($Bubble7.position.x + randf_range(-5,5) * delta, $Bubble7.position.y - randf_range(10,50) * delta);
	$Bubble8.position = Vector2($Bubble8.position.x + randf_range(-5,5) * delta, $Bubble8.position.y - randf_range(10,50) * delta);
	$Bubble9.position = Vector2($Bubble9.position.x + randf_range(-5,5) * delta, $Bubble9.position.y - randf_range(10,50) * delta);
	$Bubble10.position = Vector2($Bubble10.position.x + randf_range(-5,5) * delta, $Bubble10.position.y - randf_range(10,50) * delta);
	$Bubble11.position = Vector2($Bubble11.position.x + randf_range(-5,5) * delta, $Bubble11.position.y - randf_range(10,50) * delta);
	$Bubble12.position = Vector2($Bubble12.position.x + randf_range(-5,5) * delta, $Bubble12.position.y - randf_range(10,50) * delta);
	$Bubble13.position = Vector2($Bubble13.position.x + randf_range(-5,5) * delta, $Bubble13.position.y - randf_range(10,50) * delta);
	$Bubble14.position = Vector2($Bubble14.position.x + randf_range(-5,5) * delta, $Bubble14.position.y - randf_range(10,50) * delta);
	$Bubble15.position = Vector2($Bubble15.position.x + randf_range(-5,5) * delta, $Bubble15.position.y - randf_range(10,50) * delta);
	$Bubble16.position = Vector2($Bubble16.position.x + randf_range(-5,5) * delta, $Bubble16.position.y - randf_range(10,50) * delta);
	$Bubble17.position = Vector2($Bubble17.position.x + randf_range(-5,5) * delta, $Bubble17.position.y - randf_range(10,50) * delta);
	$Bubble18.position = Vector2($Bubble18.position.x + randf_range(-5,5) * delta, $Bubble18.position.y - randf_range(10,50) * delta);
	$Bubble19.position = Vector2($Bubble19.position.x + randf_range(-5,5) * delta, $Bubble19.position.y - randf_range(10,50) * delta);
	$Bubble20.position = Vector2($Bubble20.position.x + randf_range(-5,5) * delta, $Bubble20.position.y - randf_range(10,50) * delta);
	$Bubble21.position = Vector2($Bubble21.position.x + randf_range(-5,5) * delta, $Bubble21.position.y - randf_range(10,50) * delta);
	$Bubble22.position = Vector2($Bubble22.position.x + randf_range(-5,5) * delta, $Bubble22.position.y - randf_range(10,50) * delta);
	$Bubble23.position = Vector2($Bubble23.position.x + randf_range(-5,5) * delta, $Bubble23.position.y - randf_range(10,50) * delta);
	$Bubble24.position = Vector2($Bubble24.position.x + randf_range(-5,5) * delta, $Bubble24.position.y - randf_range(10,50) * delta);
	$Bubble25.position = Vector2($Bubble25.position.x + randf_range(-5,5) * delta, $Bubble25.position.y - randf_range(10,50) * delta);
	$Bubble26.position = Vector2($Bubble26.position.x + randf_range(-5,5) * delta, $Bubble26.position.y - randf_range(10,50) * delta);
	$Bubble27.position = Vector2($Bubble27.position.x + randf_range(-5,5) * delta, $Bubble27.position.y - randf_range(10,50) * delta);

func _on_bubble_sprite_1_animation_finished() -> void:
	$Bubble1.position = Vector2($Bubble1.position.x, startY1);
	$Bubble1/BubbleSprite1.play("Popping");

func _on_bubble_sprite_2_animation_finished() -> void:
	$Bubble2.position = Vector2($Bubble2.position.x, startY2);
	$Bubble2/BubbleSprite2.play("Popping");

func _on_bubble_sprite_3_animation_finished() -> void:
	$Bubble3.position = Vector2($Bubble3.position.x, startY3);
	$Bubble3/BubbleSprite3.play("Popping");

func _on_bubble_sprite_4_animation_finished() -> void:
	$Bubble4.position = Vector2($Bubble4.position.x, startY4);
	$Bubble4/BubbleSprite4.play("Popping");

func _on_bubble_sprite_5_animation_finished() -> void:
	$Bubble5.position = Vector2($Bubble5.position.x, startY5);
	$Bubble5/BubbleSprite5.play("Popping");

func _on_bubble_sprite_6_animation_finished() -> void:
	$Bubble6.position = Vector2($Bubble6.position.x, startY6);
	$Bubble6/BubbleSprite6.play("Popping");

func _on_bubble_sprite_7_animation_finished() -> void:
	$Bubble7.position = Vector2($Bubble7.position.x, startY7);
	$Bubble7/BubbleSprite7.play("Popping");

func _on_bubble_sprite_8_animation_finished() -> void:
	$Bubble8.position = Vector2($Bubble8.position.x, startY8);
	$Bubble8/BubbleSprite8.play("Popping");

func _on_bubble_sprite_9_animation_finished() -> void:
	$Bubble9.position = Vector2($Bubble9.position.x, startY9);
	$Bubble9/BubbleSprite9.play("Popping");

func _on_bubble_sprite_10_animation_finished() -> void:
	$Bubble10.position = Vector2($Bubble10.position.x, startY10);
	$Bubble10/BubbleSprite10.play("Popping");

func _on_bubble_sprite_11_animation_finished() -> void:
	$Bubble11.position = Vector2($Bubble11.position.x, startY11);
	$Bubble11/BubbleSprite11.play("Popping");

func _on_bubble_sprite_12_animation_finished() -> void:
	$Bubble12.position = Vector2($Bubble12.position.x, startY12);
	$Bubble12/BubbleSprite12.play("Popping");

func _on_bubble_sprite_13_animation_finished() -> void:
	$Bubble13.position = Vector2($Bubble13.position.x, startY13);
	$Bubble13/BubbleSprite13.play("Popping");

func _on_bubble_sprite_14_animation_finished() -> void:
	$Bubble14.position = Vector2($Bubble14.position.x, startY14);
	$Bubble14/BubbleSprite14.play("Popping");

func _on_bubble_sprite_15_animation_finished() -> void:
	$Bubble15.position = Vector2($Bubble15.position.x, startY15);
	$Bubble15/BubbleSprite15.play("Popping");

func _on_bubble_sprite_16_animation_finished() -> void:
	$Bubble16.position = Vector2($Bubble16.position.x, startY16);
	$Bubble16/BubbleSprite16.play("Popping");

func _on_bubble_sprite_17_animation_finished() -> void:
	$Bubble17.position = Vector2($Bubble17.position.x, startY17);
	$Bubble17/BubbleSprite17.play("Popping");

func _on_bubble_sprite_18_animation_finished() -> void:
	$Bubble18.position = Vector2($Bubble18.position.x, startY18);
	$Bubble18/BubbleSprite18.play("Popping");

func _on_bubble_sprite_19_animation_finished() -> void:
	$Bubble19.position = Vector2($Bubble19.position.x, startY19);
	$Bubble19/BubbleSprite19.play("Popping");

func _on_bubble_sprite_20_animation_finished() -> void:
	$Bubble20.position = Vector2($Bubble20.position.x, startY20);
	$Bubble20/BubbleSprite20.play("Popping");

func _on_bubble_sprite_21_animation_finished() -> void:
	$Bubble21.position = Vector2($Bubble21.position.x, startY21);
	$Bubble21/BubbleSprite21.play("Popping");

func _on_bubble_sprite_22_animation_finished() -> void:
	$Bubble22.position = Vector2($Bubble22.position.x, startY22);
	$Bubble22/BubbleSprite22.play("Popping");

func _on_bubble_sprite_23_animation_finished() -> void:
	$Bubble23.position = Vector2($Bubble23.position.x, startY23);
	$Bubble23/BubbleSprite23.play("Popping");

func _on_bubble_sprite_24_animation_finished() -> void:
	$Bubble24.position = Vector2($Bubble24.position.x, startY24);
	$Bubble24/BubbleSprite24.play("Popping");

func _on_bubble_sprite_25_animation_finished() -> void:
	$Bubble25.position = Vector2($Bubble25.position.x, startY25);
	$Bubble25/BubbleSprite25.play("Popping");

func _on_bubble_sprite_26_animation_finished() -> void:
	$Bubble26.position = Vector2($Bubble26.position.x, startY26);
	$Bubble26/BubbleSprite26.play("Popping");

func _on_bubble_sprite_27_animation_finished() -> void:
	$Bubble27.position = Vector2($Bubble27.position.x, startY27);
	$Bubble27/BubbleSprite27.play("Popping");
