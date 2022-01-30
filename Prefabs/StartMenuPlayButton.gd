extends Button


export var game_scene = "res://MainFinal.tscn"

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Button_button_up():
	print("Hello world!")
	get_tree().change_scene(game_scene)
	pass # Replace with function body.
