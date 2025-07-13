extends Node2D

var SCROLL_SPEED = -100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += SCROLL_SPEED * delta
	if Global.GameOver == true:
		SCROLL_SPEED = 0
	pass


func _on_point_area_body_entered(body: Node2D) -> void:
	Global.score += 1
	pass # Replace with function body.


func _on_upper_wall_body_entered(body: Node2D) -> void:
	Global.GameOver = true
	pass # Replace with function body.


func _on_lower_wall_body_entered(body: Node2D) -> void:
	Global.GameOver = true
	pass # Replace with function body.
