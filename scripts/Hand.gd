extends Node2D

onready var Deck = get_node("../Deck")

var hand = []
var cardPath = "res://assets/cards/"
var cardWidth
var playerNumber
export var cardScale = Vector2(1.5, 1.5)

func drawCards():
	hand = Deck.dealDeck(hand)
	spriteCards()
	placeCards()

func spriteCards():
	var firstPart = ""
	var secondPart = ""
	
	for i in hand.size():
		if hand[i].suit == "1":
			firstPart = "1-"
		elif hand[i].suit == "2":
			firstPart = "2-"
		elif hand[i].suit == "3":
			firstPart = "3-"
		elif hand[i].suit == "4":
			firstPart = "4-"
		elif hand[i].suit == "joker":
			firstPart = "red-"
			secondPart = "joker.png"
		if !hand[i].value == 20:
			secondPart = str(hand[i].value) + ".png"
		var fullPath = cardPath+firstPart+secondPart
		print(fullPath)
		hand[i].changeSprite(fullPath)
	
func placeCards():
	var pathLength = $Path2D.curve.get_baked_length()
	var space
	var idealCardWidth
	var handWidth
	
	for i in hand.size():
		cardWidth = hand[0].cardWidth()
		idealCardWidth = cardWidth * .75
		handWidth = idealCardWidth * hand.size()
		add_child(hand[i])
		
		space = pathLength
		$Path2D/PathFollow2D.offset = 0.0
		if handWidth < pathLength:
			$Path2D/PathFollow2D.offset = (space - handWidth)/2

			print("ideal cardwidth space: " + str(idealCardWidth))
		else:
			idealCardWidth = space / hand.size()
			print("ideal cardwidth crowded: " + str(idealCardWidth))
		for card in hand.size():
			if !hand[card].dealt:
				hand[card].position = $DeckLocation.position
				hand[card].handPosition = $Path2D/PathFollow2D/DeckSpawner.get_global_position()
				hand[card].handRotation = $Path2D/PathFollow2D/DeckSpawner.get_global_transform().get_rotation()
				hand[card].moveCard(hand[card].handPosition, hand[card].handRotation)
				hand[card].dealt = true
				
				$Path2D/PathFollow2D.offset += idealCardWidth
		$Path2D/PathFollow2D.offset = 0.0

func _ready():
	pass
