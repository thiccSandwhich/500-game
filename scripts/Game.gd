extends Control

onready var Deck = $CardController/Deck
onready var Player = $CardController/Player


func _ready():
	yield(get_tree().create_timer(1.0), "timeout")
	get_tree().call_group("players", "drawCards")
	
	pass
	
func _on_DealHand_pressed():
	GameManager.dealHand()
