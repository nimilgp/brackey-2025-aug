extends RigidBody2D

const X_VELOCITY = 200
const Y_VELOCITY = -500

var COMPLETED_PROCS : Array

var RECIPIES : Dictionary = {
	["oven"]: "plain-cookiel",
	["oven", "choc_dip"]: "chocolate-cookie",
	["choc_chip"]: "choco-chip-dough-ball",
	["choc_chip", "oven"]: "choco-chip-cookiel",
	["choc_chip", "oven", "choc_dip"]: "double-chocolate-cookie",
	["oven", "sprinkles"]: "sprinkles-cookie",
}

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
	for node in get_colliding_bodies():
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
			

#func generic_processor(input : RigidBody2D):
func generic_processor():
	# change animation based on input
	
	# get sprite2d node
	var sprite : Sprite2D = get_child(1)
	var new_sprite_path = "assets/" + RECIPIES.get(COMPLETED_PROCS, "burnt-cookie") + ".png"
	
	# boom
	sprite.texture = load(new_sprite_path)
