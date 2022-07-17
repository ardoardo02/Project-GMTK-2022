extends Node2D


signal add_gravity
export var current_level = 0

var dot_scene = [
	preload("res://Scene/Dot/Titik.tscn"),
	preload("res://Scene/Dot/Titik2.tscn"),
	preload("res://Scene/Dot/Titik3.tscn"),
	preload("res://Scene/Dot/Titik4.tscn"),
	preload("res://Scene/Dot/Titik5.tscn"),
	preload("res://Scene/Dot/Titik6.tscn")
]


func set_dot_layout(n:int):
	if $Titik.get_child_count() > 0:
		$Titik.get_child(0).queue_free()
	
	if n >= 0 and n <= 5:
		$Titik.add_child(dot_scene[n].instance())


func set_next_level():
	current_level += 1
	set_dot_layout(current_level)
	$Poin.reset_poin()


# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().connect("dice_reset", self, "_on_dice_reset")
	set_dot_layout(current_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Poin_tree_exited():
	set_dot_layout(1)


func _on_dice_reset():
	if current_level != 6:
		$Poin.reset_poin()
	#print("saya cinta kokoro")


func _on_level_complete():
	set_next_level()
	
	if current_level == 6:
		if $FinishTimer.is_stopped():
			$Border.speed = 0
			emit_signal("add_gravity")
			$FinishTimer.start()


func _on_FinishTimer_timeout():
	print("Ayo nikah Kokoro")
