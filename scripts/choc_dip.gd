extends "res://scripts/proc_element.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PROC_NAME = "choc_dip"
	LAUNCH_VELOCITY = Vector2(-500, -500)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	print("henlo choc dip")
	
	# freeze ball and gravity
	body.linear_velocity = Vector2()
	body.gravity_scale = 0
	
	# get cookie details in base class var
	await process_cookie(body, PROC_NAME)
	
	body.visible = true
	body.position = BODY_POSITION

	# add launch script and restore gravity
	body.linear_velocity = LAUNCH_VELOCITY
	body.gravity_scale = 1
