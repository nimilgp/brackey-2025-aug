# cookie.gd
extends CharacterBody2D

@export var gravity_strength: float = 800.0 # Adjust for stronger/weaker gravity
@export var horizontal_speed: float = 10.0 # Initial horizontal speed of the cookie
@export var max_bounce_height: float = 150.0 # Maximum height the cookie can bounce to (in pixels)

# CharacterBody2D already has a 'velocity' property.

func _ready() -> void:
	# Set initial horizontal velocity randomly to make it more dynamic
	var initial_direction: int = randi_range(0, 1) * 2 - 1 # Either -1 or 1
	velocity.x = horizontal_speed * initial_direction
	# Start with a slight upward nudge so it falls initially
	velocity.y = -50.0

func _physics_process(delta: float) -> void:
	# Apply gravity
	velocity.y += gravity_strength * delta

	# Move and slide handles collision detection and response
	move_and_slide()

	# Check for collisions after move_and_slide
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		# Check if the collision was with the paddle (assuming your paddle has a specific name or group)
		if collision.get_collider() is CharacterBody2D and collision.get_collider().name == "paddle":
			# Calculate the exact vertical velocity needed to reach max_bounce_height
			# Formula: v = -sqrt(2 * g * h)
			var calculated_bounce_v = -sqrt(2 * gravity_strength * max_bounce_height)
			# var calculated_bounce_v = -200
			
			# Apply the calculated vertical velocity for a consistent bounce height
			velocity.y = calculated_bounce_v
			
			# No friction applied to horizontal velocity, it remains constant on bounce
			# Add a slight random horizontal impulse on bounce for varied gameplay (optional)
			# velocity.x += randf_range(-20, 20) # Uncomment if you want slight horizontal variation

			# Play an animation or sound effect if you have one
			# play("bounce_animation") # Uncomment if you have a bounce animation

		# Optional: Bounce off walls (assuming "Wall" is a group or name for your wall nodes)
		#if collision.get_collider() is StaticBody2D and "Wall" in collision.get_collider().get_groups():
			#velocity.x *= -1 # Reverse horizontal direction
		#elif collision.get_collider() is CharacterBody2D and "Wall" in collision.get_collider().get_groups():
			#velocity.x *= -1 # Also handle CharacterBody2D walls if applicable
