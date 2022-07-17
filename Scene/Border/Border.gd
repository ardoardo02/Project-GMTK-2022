extends StaticBody2D


signal damaged

var speed = 0.3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if get_parent().current_level == 6:
		#queue_free()
		
	rotate(delta * speed)


func _on_FinishTimer_timeout():
	queue_free()
	print("yay")
