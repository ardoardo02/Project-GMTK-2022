extends Node2D


var hp


# Called when the node enters the scene tree for the first time.
func _ready():
	hp = 6
	get_node("Level/Border").connect("damaged", self, "_on_damaged")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_damaged():
	hp -= 1
	print(hp)
