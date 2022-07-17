extends Panel


var Mata = [
	preload("res://Scene/MataDadu/1.tscn"),
	preload("res://Scene/MataDadu/2.tscn"),
	preload("res://Scene/MataDadu/3.tscn"),
	preload("res://Scene/MataDadu/4.tscn"),
	preload("res://Scene/MataDadu/5.tscn"),
	preload("res://Scene/MataDadu/6.tscn")
	]

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(Mata[5].instance())


func set_mata(n:int):
	if get_child_count() > 0:
		var Child = get_child(0)
		if Child != null:
			Child.queue_free()
	
	if n > 0:
		add_child(Mata[n-1].instance())
