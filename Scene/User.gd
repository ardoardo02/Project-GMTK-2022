extends KinematicBody2D


var velocity = Vector2.ZERO

func _physics_process(delta):
	if Input. is_action_pressed("ui_right"):
		position.x += 10
	elif Input. is_action_pressed("ui_left"):
		position.x -= 10
	elif Input. is_action_pressed("ui_up"):
		position.y -= 10
	elif Input. is_action_pressed("ui_down"):
		position.y += 10

	move_and_collide(velocity)
