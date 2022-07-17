extends KinematicBody2D


func _physics_process(delta):
	if Input.is_mouse_button_pressed(1):
		visible = true
		get_node("Collision").disabled = false
		position = get_global_mouse_position()
		
		var diameter = get_node("Collision").shape.radius * 2
		if diameter != 40:
			get_node("Texture").rect_min_size = Vector2(diameter, diameter)
			get_node("Collision").shape.radius += (delta * 150)
			#print(get_node("Collision").shape.radius)
	else:
		visible = false
		get_node("Collision").disabled = true
		get_node("Texture").rect_min_size = Vector2(10, 10)
		get_node("Collision").shape.radius = 5
	
	get_node("AreaCursor/CollisionArea").shape.radius = get_node("Collision").shape.radius
