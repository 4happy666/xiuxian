extends CharacterBody2D
 
@export var move_speed : float = 200
@export var animator : AnimatedSprite2D

var is_game_over: bool = false

func _physics_process(delta: float) -> void:
	if not is_game_over:
		velocity = Input.get_vector("left","right","up","down") * move_speed
		# 如果速度为0，播放idle
		if velocity == Vector2.ZERO:
			animator.play("idle")
		# 如果速度不为0，播放run
		else:
			animator.play("run")
			
		move_and_slide()
 
func game_over():
	is_game_over = true
	animator.play("attack")
	await get_tree().create_timer(3).timeout
	get_tree().reload_current_scene()
