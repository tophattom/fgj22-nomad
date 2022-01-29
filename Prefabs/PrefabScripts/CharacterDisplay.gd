extends Node2D

export(Texture) var icon_25
export(Texture) var icon_50
export(Texture) var icon_75
export(Texture) var icon_100

var hp = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#get hp
	$CharacterIcon.texture = icon_25
	if (hp > 25):
		$CharacterIcon.texture = icon_50
	if (hp > 55):
		$CharacterIcon.texture = icon_75
	if (hp > 75):
		$CharacterIcon.texture = icon_100
	

func get_hp():
	return hp #placeholder
	
