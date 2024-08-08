extends CharacterBody3D

var gravity_magnitude : float = ProjectSettings.get_setting("physics/3d/default_gravity")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var target_velocity : Vector3 = velocity
	if not is_on_floor():
		target_velocity.y -= delta * gravity_magnitude
	velocity = target_velocity
	move_and_slide()
	
	pass


# Check for collisions
# Delete Node if collding with player
func _on_area_3d_body_entered(body):
	print(body.name)
	pass 
