extends Node2D

var wall_scene : PackedScene = load("res://Scenes/wall_node.tscn")
const START_POS = Vector2(362, 122)
var GameRunning = false
var Score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.GameOver = false
	GameRunning = false
	Global.score = 0
	$Score.hide()
	$EndScreen.hide()
	$Backgrounds/Night1.hide()
	$Backgrounds/Night2.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.GameOver == false:
		if Input.is_action_just_pressed("jump"):
			if GameRunning == false:
				GameRunning = true
				$StartScreen.hide()
				$PipeTimer.start()
				$Score.show()
			$Player.jump()
	else:
		$Ground.SCROLL_SPEED = 0
		$PipeTimer.stop()
		$Player.set_rotation(PI/2)
		$EndScreen.show()  
		if Input.is_action_just_pressed("jump"):
			get_tree().reload_current_scene()
	
	if Global.score > 20:
		$Backgrounds/Night1.show()
		$Backgrounds/Night2.show()
	
	$Score.text = "Score: " + str(Global.score)
	pass

func _on_pipe_timer_timeout() -> void:
	var wall = wall_scene.instantiate()
	wall.position = Vector2(START_POS.x, randi_range(90, 150))
	$Walls.add_child(wall)
	pass # Replace with function body.


func _on_ground_body_entered(body: Node2D) -> void:
	Global.GameOver = true
	pass # Replace with function body.
