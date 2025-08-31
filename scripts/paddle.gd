extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

var dragging = false
var click_radius = 32 # Size of the sprite.
var mouse_pos
var is_dragging = false
var PADDLE_SPEED = 400

func _input_event(viewport, event, shape_idx):
	# Check if the event is a mouse button press.
	if event is InputEventMouseButton:
		# Check if it was the left mouse button and it was just pressed down.
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			# When clicked, start dragging.
			is_dragging = true


func _unhandled_input(event):
	# We use this to detect a global mouse release.
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.is_pressed():
			# When the button is released anywhere, stop dragging.
			is_dragging = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Only update the position if the character is being dragged.
	if is_dragging:
		# get sprite2d node
		var sprite : Sprite2D = get_child(1)
		var new_sprite_path = "assets/paddle-sprites2.png"
		# boom
		sprite.texture = load(new_sprite_path)
		
		global_position = get_global_mouse_position()
		# rotation
		if Input.is_key_pressed(KEY_A):
			rotation = 25
		elif Input.is_key_pressed(KEY_D):
			rotation = -25
		elif Input.is_key_pressed(KEY_S):
			rotation = 0
	else:
		var sprite : Sprite2D = get_child(1)
		var new_sprite_path = "assets/paddle-sprites1.png"
		# boom
		sprite.texture = load(new_sprite_path)


func read_current_rotation():
	if rotation > 0:
		return 'right'
	elif rotation == 0:
		return 'center'
	else:
		return 'left'
