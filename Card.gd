extends TextureButton
class_name Card

var suit
var value
var face
var back


func _ready():
	pass

func _init(var suit, var value):
	value = value
	suit = suit
	face = load("res://assets/cards/card-"+str(suit)+"-"+str(value)+".png")
	back = GameManager.cardBack
	set_normal_texture(face)
