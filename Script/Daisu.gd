extends RigidBody2D

#signal hit_wall
var max_speed = 700

var counter = 0
var hp = 6
var EFFECT = preload("res://Scene/BounceParticle.tscn")

var init_pos = Vector2(300, 450)


func _ready():
	global_position = Vector2(300, 450)
	

func _process(delta):
	if abs(get_linear_velocity().x) > max_speed or abs(get_linear_velocity().y) > max_speed:
		var new_speed = get_linear_velocity().normalized()
		new_speed *= max_speed
		set_linear_velocity(new_speed)
	
	if abs(global_position[0]) > 600 or abs(global_position[1]) > 600:
		global_position = Vector2(300, 450)


func _on_CollisionDetector_body_entered(body):
#	if body.is_in_group('wall'):
#		emit_signal("hit_wall")
	
	if body.get_name() == "Border" or body.get_name().begins_with("Dot"):
		var effect = EFFECT.instance()
		effect.global_position = global_position
		get_parent().add_child(effect)
#		emit_signal("hit_wall")
	
	#print(body.get_name())


func _on_CollisionDetector_area_entered(area):
	print(area.get_name())
	if area.get_name() == "Offside":
		#print(global_position)
		global_position = Vector2(180, 320)
	
	if area.get_name() == "AreaCursor":
		counter += 1
		hp -= 1
		
		if hp <= 0:
			$Timer.start()
		
		get_node("Body").set_mata(hp)


func _on_Timer_timeout():
	var effect = EFFECT.instance()
	effect.global_position = global_position
	get_parent().add_child(effect)
	queue_free()
