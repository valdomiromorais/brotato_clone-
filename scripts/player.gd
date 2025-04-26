class_name Player extends CharacterBody2D

@export_category("Player Settings")
@export
var move_speed: float = 256.0

func _ready() -> void:
	global.player = self

func _physics_process(_delta: float) -> void:
	move()

func move() -> void:
	var direction:= Vector2( Input.get_axis("move_left","move_right"), # X axis
				Input.get_axis("move_up","move_down") ).normalized()   # Y axis
	
	velocity = direction * move_speed
	
	move_and_slide()
