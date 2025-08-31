extends Area2D

@onready var timer2: Timer = $Timer2
@onready var game: Node2D = $"../.."
@onready var BALL_INIT_POS = $".".position

const BALL = preload("res://scenes/ball.tscn")
const BALL_VEL : Vector2 = Vector2(200, 0)

const DOUGH_PRODUCTION_COST = 1

# Game manager
@onready var game_manager : Node = %"game-manager"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_2_timeout() -> void:
	# update money
	game_manager.reduce_money(DOUGH_PRODUCTION_COST)
	
	# get position of dough dispenser
	# create new dough
	var new_ball = BALL.instantiate()
	
	# set position and velocity
	new_ball.position = BALL_INIT_POS
	new_ball.linear_velocity = BALL_VEL
	
	# shoot
	game.add_child(new_ball)

	
