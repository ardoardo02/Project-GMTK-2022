extends KinematicBody2D

export (int) var speed = 500

var velocity = Vector2()
var gameStart = false
var gameEnd = false

func _ready():
	var startSignal = get_parent().connect("start", self, "on_start_game")
#	var endSignal = get_parent().connect("habis", self, "on_end_game")

func on_start_game():
	gameStart = true
#
#func on_end_game():
#	print("mengakhiri permainan")
#	gameEnd = true

#func get_input():
#	velocity = Vector2()
#	velocity.y += 20
#	if Input.is_action_pressed("ui_right"):
#		velocity.x += 1
#	if Input.is_action_pressed("ui_left"):
#		velocity.x -= 1
#	if Input.is_action_pressed("ui_down"):
#		velocity.y += 1
#	if Input.is_action_pressed("ui_up"):
#		velocity.y -= 1
#	velocity = velocity.normalized() * speed

func _physics_process(delta):
	if gameStart == true or gameEnd == true:
		velocity = Vector2()
		if position.y > 300 and gameStart:
			velocity.y -= 20
			gameStart = false
		if position.y > 900 and gameEnd:
			velocity.y -= 20
			gameEnd = false
		velocity.y += 20
		velocity = velocity.normalized() * speed
#
##	get_input()
	velocity = move_and_slide(velocity)
	pass
