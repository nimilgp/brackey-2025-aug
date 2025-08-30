extends RigidBody2D

const X_VELOCITY = 300
const Y_VELOCITY = -700

var COMPLETED_PROCS : Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#print(position)
	pass
	
func _physics_process(delta: float) -> void:
	#print("balls speed: ", linear_velocity)
	pass

func _integrate_forces(state):
	for node : CharacterBody2D in get_colliding_bodies():
		if node.is_in_group("paddles"):
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
			

func generic_processor(input : RigidBody2D):
	# create new rigidbody with correct output
	# and launch it using velocity
	
	# input: cookie, dough, etc
	print("nimil's gay function")
