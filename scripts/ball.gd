extends RigidBody2D

const X_VELOCITY = 300
const Y_VELOCITY = -700


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	print("balls speed: ", linear_velocity)

func _integrate_forces(state):
	for node : CharacterBody2D in get_colliding_bodies():
		if node.name == "paddle":
			# read the rotation angle of paddle
			var paddle_rotation = node.read_current_rotation()
		
			if paddle_rotation == "right":
				linear_velocity.x = -X_VELOCITY
			elif paddle_rotation == "left":
				linear_velocity.x = X_VELOCITY
			elif paddle_rotation == "center":
				linear_velocity.x = 0
				
			# maintain height
			linear_velocity.y = Y_VELOCITY
