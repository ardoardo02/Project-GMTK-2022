extends Node2D


var Spike = preload("res://Scene/Spike/Spike.tscn")

var coordinates = [
	[Vector2(150, 290), 0],
	[Vector2(-150, 290), 0],
	[Vector2(-150, -290), 180],
	[Vector2(150, -290), 180],
	[Vector2(290, -150), -90],
	[Vector2(290, 150), -90],
	[Vector2(-290, 150), 90],
	[Vector2(-290, -150), 90],
]

var places = []


func pick_places(n:int):
	var rng = RandomNumberGenerator.new()
	places = []
	
	while len(places) < n:
		rng.randomize()
		var place = rng.randi_range(0, len(coordinates)-1)
		
		if not(place in places):
			places.append(place)


func set_spike():
	if get_child_count() > 0:
		for i in range(0, get_child_count()):
			get_child(i).queue_free()
		
	for coordinate in places:
		var spike = Spike.instance()
		spike.global_position = coordinates[coordinate][0]
		spike.rotation_degrees = coordinates[coordinate][1]
		#spike.connect("hit", self, "_on_Poin_hit")
		#poin.connect("tree_exited", self, )
		add_child(spike)


# Called when the node enters the scene tree for the first time.
func _ready():
	pick_places(2)
	set_spike()


func reset_spike():
	pick_places(2)
	set_spike()


func _on_Timer_timeout():
	print("masuk")
	reset_spike()
