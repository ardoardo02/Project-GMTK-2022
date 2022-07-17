extends Node2D


signal complete

var coordinates = [
	#Vector2(-232, 244),
	#Vector2(-20, 157),
	#Vector2(244, -255),
	#Vector2(254, 244),
	#Vector2(-240, -247),
	#Vector2(14, -151),
	#Vector2(209, -13),
	#Vector2(-201, 24),	
]

var Poin = preload("res://Scene/Poin/Poin.tscn") 
var places = []

var poin2complete = 0


func pick_places(n:int):
	var rng = RandomNumberGenerator.new()
	places = []
	
	while len(places) < n:
		rng.randomize()
		var place = rng.randi_range(0, len(coordinates)-1)
		
		if not(place in places):
			places.append(place)
	
	print(places)
	poin2complete = n


func set_poin():
	if get_child_count() > 0:
		for i in range(0, get_child_count()):
			get_child(i).queue_free()
		
	for coordinate in places:
		var poin = Poin.instance()
		poin.global_position = coordinates[coordinate]
		poin.connect("hit", self, "_on_Poin_hit")
		#poin.connect("tree_exited", self, )
		add_child(poin)


func reset_poin():
	pick_places(6)
	set_poin()

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("complete", get_parent(), "_on_level_complete")
	
	for x in range(-230, 230, 50):
		for y in range(-230, 230, 50):
			if get_parent().current_level in [0, 2, 4]:
				print("gak ada di tengah")
				if ((x < -140) or (x > 140)) and ((y < -140) or (y > 140)):
					coordinates.append(Vector2(x, y))
			else:
				print("harusnya ada di tengah")
				coordinates.append(Vector2(x, y))
			
	
	pick_places(6)
	set_poin()


func _on_Poin_hit():
	poin2complete -= 1
	print(poin2complete)
	
	if poin2complete == 0:
		emit_signal("complete")
		print("done")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
