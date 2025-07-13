extends Area2D

const START_POS = Vector2(84, 252)
const END_POS = Vector2(-300, 252)
var SCROLL_SPEED = -100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = START_POS
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += SCROLL_SPEED * delta
	if position.x <= END_POS.x:
		position.x = START_POS.x
	pass
