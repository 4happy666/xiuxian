extends Area2D

@export var monster_speed: float = -80;
#@export var animator : AnimatedSprite2D

var is_dead: bool = false

func _physics_process(delta: float) -> void:
	if not is_dead:
		position += Vector2(monster_speed, 0) * delta
	if position.x <= -410:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.game_over()
 
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullets"):
		is_dead = true
		area.queue_free()
		get_tree().current_scene.score += 1
		$AnimatedSprite2D.play("death")
		#animator.play("death")
		await get_tree().create_timer(0.5).timeout
		queue_free()
