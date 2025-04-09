extends Node2D

@export var kulou_scene: PackedScene
@export var spawn_timer: Timer
@export var score: int = 0
@export var score_label: Label

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn_timer.wait_time -= 0.2 * delta
	spawn_timer.wait_time = clamp(spawn_timer.wait_time, 1, 3)
	
	score_label.text = "Score:" + str(score);

func _on_spawn_kulou() -> void:
	var kulou = kulou_scene.instantiate()
	kulou.position = Vector2(420, randf_range(120, 200));
	get_tree().current_scene.add_child(kulou)
