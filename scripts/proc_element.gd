extends Area2D

# Child data
var PROC_NAME : String
var LAUNCH_VELOCITY : Vector2
var BODY_POSITION : Vector2

@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func process_cookie(body: RigidBody2D, PROC_NAME : String):
	# appends processing to cookie
	# calls timer and destroys old cookie
	
	# store cookie data
	var body_name = body.name
	BODY_POSITION = body.position
	
	# only do this if body hasn't already been here
	if not body.COMPLETED_PROCS.has(PROC_NAME) and body.is_in_group("food"):
		body.COMPLETED_PROCS.append(PROC_NAME)
		
		# bind timer to cookie_launch
		# timer.timeout.connect(Callable(self, "cookie_processor").bind(body))
		timer.start()
		
		body.visible = false
		await timer.timeout
