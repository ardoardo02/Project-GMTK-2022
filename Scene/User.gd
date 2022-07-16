extends KinematicBody2D


func _physics_process(_delta):
	if Input.is_mouse_button_pressed(1):
		visible = false
		get_node("CollisionShape2D").disabled = false
		position = get_global_mouse_position()
	else:
		visible = false
		get_node("CollisionShape2D").disabled = true
