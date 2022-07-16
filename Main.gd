extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var EFFECT = preload("res://Scene/BounceParticle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Daisu.connect("hit_wall", self, "on_dice_hit_wall")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_dice_hit_wall():
	var effect = EFFECT.instance()
	add_child(effect)
	effect.global_position = Vector2($Daisu.position)

func _on_Poin3_hit():
	pass # Replace with function body.
