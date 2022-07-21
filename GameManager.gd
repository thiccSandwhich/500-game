extends Node

onready var Game = get_node('/root/Game/')

var deck = Array()

var cardBack = preload("res://assets/cards/cardBack_red2.png")

func _ready():
	fillDeck()
	dealDeck()

func fillDeck():
	for i in range(1,5,1):
		for j in range (1,14,1):
			deck.append(Card.new(i,j))
			j+=1
		i += 1


func dealDeck():
	var c = 1
	while c < 52:
		Game.get_node("GridContainer").add_child(deck[c])
		c += 1
