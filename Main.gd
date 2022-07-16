extends Node2D


var hp

var EFFECT = preload("res://Scene/BounceParticle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Daisu.connect("hit_wall", self, "on_dice_hit_wall")
	hp = 6
	get_node("Level/Border").connect("damaged", self, "_on_damaged")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_dice_hit_wall():
	var effect = EFFECT.instance()
	add_child(effect)
	effect.global_position = Vector2($Daisu.position)

func _on_damaged():
	hp -= 1
	print(hp)
