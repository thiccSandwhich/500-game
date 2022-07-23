extends Node



var cardBack = preload("res://assets/cards/cardBack_red2.png")

var card1
var card2

var player1Hand = Array()
var player2Hand = Array()
var player3Hand = Array()
var player4Hand = Array()
var kitty = Array()



func _ready():
	randomize()
#	$Deck.dealDeck()



