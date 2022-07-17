extends RigidBody2D

#signal hit_wall
var max_speed = 700

var EFFECT = preload("res://Scene/BounceParticle.tscn")

var init_pos = Vector2(475, -250)


func _ready():
	global_position = init_pos
	

func _process(delta):
	if abs(get_linear_velocity().x) > max_speed or abs(get_linear_velocity().y) > max_speed:
		var new_speed = get_linear_velocity().normalized()
		new_speed *= max_speed
		set_linear_velocity(new_speed)
	
	if global_position[0] > 600 or global_position[1] > 0 or global_position[0] < 0 or global_position[1] < -600:
		global_position = init_pos


func _on_CollisionDetector_body_entered(body):
#	if body.is_in_group('wall'):
#		emit_signal("hit_wall")
	
	if body.get_name() == "Border" or body.get_name().begins_with("Dot"):
		var effect = EFFECT.instance()
		effect.global_position = global_position
		$BounceSound.play()
		get_parent().add_child(effect)
#		emit_signal("hit_wall")
	
	#print(body.get_name())
