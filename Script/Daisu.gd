extends RigidBody2D

#signal hit_wall
#signal end

var max_speed = 700
var immortal = false

var counter = 0
var hp = 6
var EFFECT = preload("res://Scene/BounceParticle.tscn")

var debounceTanah = false

var init_pos = Vector2(300, 450)
var check_offside = true

func _ready():
	global_position = Vector2(300, 450)
	get_parent().get_node("Level").connect("add_gravity", self, "_on_Level_add_gravity")
	

func _process(delta):
	if abs(get_linear_velocity().x) > max_speed or abs(get_linear_velocity().y) > max_speed:
		var new_speed = get_linear_velocity().normalized()
		new_speed *= max_speed
		set_linear_velocity(new_speed)
	
	if check_offside:
		if global_position[0] > 600 or global_position[1] > 600 or global_position[0] < 0 or global_position[1] < 0:
			global_position = Vector2(300, 450)


func _on_CollisionDetector_body_entered(body):
#	if body.is_in_group('wall'):
#		emit_signal("hit_wall")
	
	if body.get_name() == "Border" or body.get_name().begins_with("Dot"):
		var effect = EFFECT.instance()
		effect.global_position = global_position
		$BounceSound.play()
		get_parent().add_child(effect)
#		emit_signal("hit_wall")
	if body.get_name() == "tanah" and !debounceTanah:
		debounceTanah = true
		var effect = EFFECT.instance()
		effect.global_position = global_position
		$BounceSound.play()
		get_parent().add_child(effect)
	
	#print(body.get_name())


func _on_CollisionDetector_area_entered(area):
	if "Poin" in area.get_name():
		if hp < 6:
			hp += 1
			get_node("Body").set_mata(hp)
		
		if not($Timer.is_stopped()):
			$Timer.stop()

	if not immortal:
		if "Spike" in area.get_name():
			hp -= 1
			$JadiMerah.start()
			$Body.get_stylebox("panel", "").set_bg_color(Color("#f11414"))
			get_node("Body").set_mata(hp)
		
		#$Body.get_stylebox("panel", "").update()
	
		if area.get_name() == "AreaCursor":
			counter += 1
		
			if $Cooldown.is_stopped():
				$Cooldown.start()
				hp -= 1
				get_node("Body").set_mata(hp)
		
		
	if hp <= 0:
		if $Timer.is_stopped():
			$Timer.start()
		


func _on_Timer_timeout():
	var effect = EFFECT.instance()
	effect.global_position = global_position
	get_parent().add_child(effect)
	queue_free()


func _on_JadiMerah_timeout():
	$Body.get_stylebox("panel", "").set_bg_color(Color("#593d70"))


func _on_Level_add_gravity():
	gravity_scale = 1
#	bounce = 0
	check_offside = false
	$Kamera.current = true
	get_parent().get_node("Cursor").disable = true
#	emit_signal("end")
