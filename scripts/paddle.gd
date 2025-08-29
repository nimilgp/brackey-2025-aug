# paddle.gd
extends CharacterBody2D

@export var speed: float = 220.0 # Movement speed of the paddle

func _physics_process(delta: float) -> void:
	# Get input for left/right movement
	var input_direction: float = Input.get_axis("ui_left", "ui_right")
	
	velocity.x = input_direction * speed

	move_and_slide()
