extends AnimatedSprite2D

@export var bullet_speed: float = 100;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += Vector2(bullet_speed, 0) * delta

 
func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("kill player")
		body.game_over()
 
