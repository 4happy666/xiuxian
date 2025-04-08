extends Area2D

@export var monster_speed: float = -80;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += Vector2(monster_speed, 0) * delta


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("kill player")
		body.game_over()
 
