class_name Enemy
extends CharacterBody2D

enum Direction {
	Left = -1,
	Right = 1
}

@export var direction := Direction.Left:
	set(v):
		direction = v
		if not is_node_ready():
			await ready
		graphics.scale.x = -direction
		
@export var max_speed: float = 180
@export var acceleration: float = 2000

var default_gravity := ProjectSettings.get("physics/2d/default_gravity") as float

@onready var graphics: Node2D = $Graphics
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var state_machine: Node = $StateMachine

func move(speed: float, delta: float) -> void:
	# 修改速度向量
	velocity.x = move_toward(velocity.x, speed * direction, acceleration * delta)
	velocity.y += default_gravity * delta
	
	move_and_slide()
