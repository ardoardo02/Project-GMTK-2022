extends KinematicBody2D

#export (int) var speed = 500
#
#var velocity = Vector2()
##var timer = false

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
#	if timer == true:
#		velocity = Vector2()
#		if position.y > 300:
#			velocity.y -= 20
#			timer = false
#		velocity.y += 20
#		velocity = velocity.normalized() * speed
#
##	get_input()
#	velocity = move_and_slide(velocity)
	pass
