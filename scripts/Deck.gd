extends Node

var cardNames = ["1-4", "1-5", "1-6", "1-7", "1-8", "1-9", 
				"1-10", "1-11", "1-12", "1-13","1-14",	
				"1-4", "2-5", "2-6", "2-7", "2-8", "2-9", 
				"2-10", "2-11", "2-12", "2-13","2-14",	
				"3-4", "3-5", "3-6", "3-7", "3-8", "3-9", 
				"3-10", "3-11", "3-12", "3-13","3-14",	
				"4-4", "4-5", "4-6", "4-7", "4-8", "4-9", 
				"4-10", "4-11", "4-12", "4-13","4-14",	
				"joker"]

var cardValues = [4,5,6,7,8,9,10,11,12,13,14,
					4,5,6,7,8,9,10,11,12,13,14,
					4,5,6,7,8,9,10,11,12,13,14,
					4,5,6,7,8,9,10,11,12,13,14, 20]

var cardSuits = ["1","1","1","1","1","1","1","1",
				"1","1","1",
				"2","2","2","2","2","2",
				"2","2","2","2","2",
				"3","3","3","3","3","3",
				"3","3","3","3","3",
				"4","4","4","4","4","4",
				"4","4","4","4","4", "joker"]
				
var deck = Array()

func _ready():
	randomize()
	makeDeck()

	
func makeDeck():
	var cardScene = load("res://Scenes/Card.tscn")
	var card
	for i in cardNames.size():
		card = cardScene.instance()
		card.cardName = cardNames[i]
		card.value = cardValues[i]
		card.suit = cardSuits[i]
		deck.append(card)
	deck.shuffle()

func dealDeck(var hand):
	var handSize = 10
	for i in handSize:
		hand.append(deck[0])
		print(hand[i].cardName)
		deck.remove(0)
	return hand
