extends Area2D


signal hit


func _ready():
	pass # Replace with function body.


func _process(delta):
	rotate(delta * -1)
	#pass


func _on_Poin_body_entered(body):
	if body.get_name() == "Daisu":
		emit_signal("hit")		
		queue_free()


func _on_Poin_tree_exited():
	#emit_signal("hit")
	#print("signal send")
	pass
