extends Area2D


signal hit


func _ready():
	pass # Replace with function body.


func _on_Poin_body_entered(body):
	if body.get_name() == "Daisu":
		queue_free()


func _on_Poin_tree_exited():
	emit_signal("hit")
	print("signal send")
