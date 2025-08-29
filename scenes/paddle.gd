extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


var PADDLE_SPEED = 400
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		position.x -= 400 * delta
	if Input.is_action_pressed("ui_right"):
		position.x += 400 * delta
