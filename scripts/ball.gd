extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	print("balls speed: ", linear_velocity)

const Y_FORCE = -10000
var thrust = Vector2(0, Y_FORCE)

func _integrate_forces(state):
	for node : CharacterBody2D in get_colliding_bodies():
		if node.name == "paddle":
			# read the rotation angle of paddle
			var paddle_rotation = node.read_current_rotation()
		
			if paddle_rotation == "right":
				thrust = Vector2(0, Y_FORCE)
			elif paddle_rotation == "left":
				thrust = Vector2(0, Y_FORCE)
				
			# apply rotated thrust
			state.apply_force(thrust.rotated(rotation))
