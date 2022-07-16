extends KinematicBody2D


func _physics_process(_delta):
	if Input.is_mouse_button_pressed(1):
		visible = true
		get_node("Collision").disabled = false
		position = get_global_mouse_position()
		print(get_node("Texture").rect_scale)
	else:
		visible = false
		get_node("Collision").disabled = true
