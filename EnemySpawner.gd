extends Node3D

# Enemy spawn cooldown
@export var cooldown : float = 5
# Import enemy scene
@export var enemy : PackedScene
# Spawn timer reference
@onready var timer := $Timer
# RNG for enemy position
var rng = RandomNumberGenerator.new()

# Instantiate enemy to different node
signal instantiate_enemy(enemy : Node3D)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	var instance : Node3D = enemy.instantiate() as Node3D
	var offset = Vector3(rng.randf_range(-10.0, 10.0), 2,rng.randf_range(-10.0, 10.0))
	while (offset.x > -2 && offset.x < 2) && (offset.y > -2 && offset.y < 2):
		offset = Vector3(rng.randf_range(-10.0, 10.0), 2,rng.randf_range(-10.0, 10.0))
	var enemy_pos : Vector3 = global_position + offset
	instance.position = enemy_pos
	instantiate_enemy.emit(instance)
	pass 

func _on_root_ready() -> void:
	timer.wait_time = cooldown
	pass # Replace with function body.
