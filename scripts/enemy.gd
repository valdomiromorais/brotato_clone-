class_name Enemy extends CharacterBody2D

enum EnemyType{CHASER, CHASER_AND_DASHER}

@export_category("Enemy Settings")
@export
var enemy_type: EnemyType = EnemyType.CHASER
@export
var move_speed: float = 192.0
@export
var dash_speed: float = move_speed * 4

@export_category("Auxiliary Objects")
@export
var dash_wait_timer: Timer

func _physics_process(_delta: float) -> void:
	if global.player == null:
		print("Player não encontrado ...")
		return
	var direction: Vector2 = global_position.direction_to(global.player.global_position)
	match enemy_type:
		EnemyType.CHASER:
			chase(direction)
		EnemyType.CHASER_AND_DASHER:
			chase_and_dash(direction)
	move_and_slide()

func chase(direction:Vector2) -> void:
	velocity = direction * move_speed

func chase_and_dash(direction:Vector2) -> void:
	pass

func _on_body_entered(body) -> void:
	if enemy_type != EnemyType.CHASER_AND_DASHER:
		return
	
	if body is Player:
		dash_wait_timer.start()

func _on_timer_timeout() -> void:
	pass # Replace with function body.
