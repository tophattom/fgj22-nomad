extends Node2D

onready var parent = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var hp = parent.get_hp()
	$HPbar.rect_scale.x = hp / 100.0
	
