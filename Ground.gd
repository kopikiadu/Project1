extends StaticBody3D

@onready var mesh_instance := $MeshInstance3D
@onready var collider := $CollisionShape3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func resize_ground():
	var box = BoxShape3D.new()
	var mesh : PlaneMesh = mesh_instance.mesh as PlaneMesh
	box.size.x = mesh.size.x
	box.size.z = mesh.size.y
	box.size.y = 1
	collider.shape = box
	var format_string = "Collider size: %s, %s, %s"
	var print_string = format_string % [(collider.shape as BoxShape3D).size.x,(collider.shape as BoxShape3D).size.y,(collider.shape as BoxShape3D).size.z]
	print(print_string)
	pass
