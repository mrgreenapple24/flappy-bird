extends CharacterBody2D

const GRAVITY = 10
const JUMP_SPEED = -200
const MAX_SPEED = 200
var GameRunning = false

func _ready() -> void:
	$PointLight2D.hide()

func _physics_process(_delta: float) -> void:
	if GameRunning == true:
		velocity.y += GRAVITY
		if velocity.y > MAX_SPEED:
			velocity.y = MAX_SPEED
	move_and_slide()

func _process(delta: float) -> void:
	if Global.GameOver:
		$PointLight2D.hide()
		$AnimatedSprite2D.stop()

func jump():
	GameRunning = true
	velocity.y = JUMP_SPEED
