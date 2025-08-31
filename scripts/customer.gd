extends Area2D

var CURRENT_RECIPE : String
@onready var game_manager: Node = %"game-manager"

var PRICE : Dictionary = {
	"plain-cookiel": 5,
	"chocolate-cookie": 7,
	"choco-chip-dough-ball": 3,
	"choco-chip-cookiel": 6,
	"double-chocolate-cookie": 9,
	"sprinkles-cookie": 7
}

const COOKIE_COUNT = 6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CURRENT_RECIPE = "plain-cookiel"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	var cookie_name = body.RECIPIES.get(body.COMPLETED_PROCS)
	
	if body.is_in_group("food"):
		if CURRENT_RECIPE == cookie_name:
			game_manager.add_money(PRICE.get(cookie_name))
			
			# get new recipe
			var random_idx = randi_range(0, COOKIE_COUNT-1)
			CURRENT_RECIPE = PRICE.keys().get(random_idx)
			
			# change sprite
			var cookie_sprite : Sprite2D = get_child(2)
			var sprite_change_path = "assets/" + CURRENT_RECIPE + ".png"
			cookie_sprite.texture = load(sprite_change_path)
			
	body.queue_free()
