extends Area2D
var suit
var value
var cardName
var back
var dealt = false

export(Texture) var cardSprite
var cardScale setget change_card_scale

var handPosition = Vector2.ZERO
var handRotation = Vector2.ZERO

func moveCard(dest, rotate = null, _scale = null):
	$Tween.interpolate_property(self, "position" , position, dest, .5, Tween.TRANS_BACK, Tween.EASE_OUT)
	if rotate != null:
		$Tween.interpolate_property(self, "rotation", rotation, rotate, .5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if _scale != null:
		$Tween.interpolate_property(self, "scale", scale, _scale, .5, Tween.TRANS_BACK, Tween.EASE_OUT)
		yield(get_tree().create_timer(1.0), "timeout")
	$Tween.set_active(1)
#	$Tween.start()

func changeSprite(path):
	$Sprite.texture = load(path)

func change_card_scale(_scale):
	scale = _scale

func cardWidth():
	var cardWidth = $Sprite.texture.get_width() * scale.x
	return cardWidth

func _ready(): 
	pass

func killCard():
	queue_free()

