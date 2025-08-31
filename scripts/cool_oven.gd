extends "res://scripts/proc_element.gd"

@onready var game_manager: Node = %"game-manager"

const SPRINKLY_PROD_PRICE = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PROC_NAME = "sprinkles"
	LAUNCH_VELOCITY = Vector2(400, -500)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	print("henlo sprinkles")
	
	# freeze ball and gravity
	body.linear_velocity = Vector2()
	body.gravity_scale = 0
	
	# get cookie details in base class var
	await process_cookie(body, PROC_NAME)
	
	game_manager.reduce_money(SPRINKLY_PROD_PRICE)
	
	# change cookie animation based on recipe
	body.generic_processor()
	body.visible = true

	# add launch script and restore gravity
	body.linear_velocity = LAUNCH_VELOCITY
	body.gravity_scale = 1
