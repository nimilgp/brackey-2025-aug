extends Node

var money = 10 
@onready var money_label: Label = $"money-label"

func _process(delta: float) -> void:
	if money == 0:
		pass
		# end game

func add_money(amount):
	money += amount
	money_label.text = "$"+ str(money)

func reduce_money(amount):
	money -= amount
	money_label.text = "$"+ str(money)
	
