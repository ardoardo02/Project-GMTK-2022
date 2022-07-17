extends Node2D


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

# Called when the node enters the scene tree for the first time.
func _ready():
	set_dot_layout(current_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(delta * 0.3)


func _on_Poin_tree_exited():
	set_dot_layout(1)
