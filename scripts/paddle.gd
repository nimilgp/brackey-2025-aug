extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

var dragging = false
var click_radius = 32 # Size of the sprite.
var mouse_pos



func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		mouse_pos = get_global_mouse_position()
		
		if (mouse_pos - position).length() < click_radius:
			# Start dragging if the click is on the sprite.
			if not dragging and event.pressed:
				dragging = true
		# Stop dragging if the button is released.
		if dragging and not event.pressed:
			dragging = false

	if event is InputEventMouseMotion and dragging:
		# While dragging, move the sprite with the mouse.
		position = get_global_mouse_position()
		


var PADDLE_SPEED = 400
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# linear movement
	if Input.is_action_pressed("ui_left"):
		position.x -= PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_right"):
		position.x += PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_up"):
		position.y -= PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_down"):
		position.y += PADDLE_SPEED * delta
		
	# rotation
	if Input.is_key_pressed(KEY_A):
		rotation = 25
	elif Input.is_key_pressed(KEY_D):
		rotation = -25
	elif Input.is_key_pressed(KEY_S):
		rotation = 0

func read_current_rotation():
	if rotation > 0:
		return 'right'
	elif rotation == 0:
		return 'center'
	else:
		return 'left'
