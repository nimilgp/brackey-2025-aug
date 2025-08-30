extends "res://scripts/proc_element.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PROC_NAME = "oven"
	LAUNCH_VELOCITY = Vector2(10, 100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	print("henlo oven")
	
	# get cookie details in base class var
	await process_cookie(body, PROC_NAME)

	# add launch script
