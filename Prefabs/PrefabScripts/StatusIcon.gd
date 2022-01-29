extends Node2D

export(Texture) var icon

# Called when the node enters the scene tree for the first time.
func _ready():
	$Icon.texture = icon
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
