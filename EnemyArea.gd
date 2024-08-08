extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_monitoring(true)
	
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if has_overlapping_bodies():
		print("hjuh")
	pass
