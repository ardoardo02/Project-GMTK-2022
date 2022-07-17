extends Node2D


var hp
var counter = 0

var EFFECT = preload("res://Scene/BounceParticle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Daisu.connect("hit_wall", self, "on_dice_hit_wall")
	hp = 6


func on_dice_hit_wall():
	var effect = EFFECT.instance()
	add_child(effect)
	effect.global_position = Vector2($Daisu.position)


func _on_Daisu_tree_exited():
	var DAISU = load("res://Scene/Daisu.tscn")
	var daisu = DAISU.instance()
	daisu.global_position = Vector2(260, 400)
	add_child(daisu)
	get_node("Daisu").connect("tree_exited", self, "_on_Daisu_tree_exited")
