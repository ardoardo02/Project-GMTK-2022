extends Node2D


signal dice_reset
signal start
#signal habis

var hp
var counter = 0

#var EFFECT = preload("res://Scene/BounceParticle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
#	$Daisu.connect("end", self, "on_end_game")
	hp = 6

#func on_end_game():
#	emit_signal("habis")

#func on_dice_hit_wall():
#	var effect = EFFECT.instance()
#	add_child(effect)
#	effect.global_position = Vector2($Daisu.position)


func _on_Daisu_tree_exited():
	emit_signal("dice_reset")
	$DeathSound.play()
	
	var DAISU = load("res://Scene/Daisu.tscn")
	var daisu = DAISU.instance()
	daisu.global_position = Vector2(260, 400)
	add_child(daisu)
	get_node("Daisu").connect("tree_exited", self, "_on_Daisu_tree_exited")


func _on_PlayButton_body_entered(body):
	$Start/StartSound.play()
	yield(get_tree().create_timer(1), "timeout")
	emit_signal("start")
	$Start/WaktuHapus.start()


func _on_Timer_timeout():
	$Start.queue_free()
