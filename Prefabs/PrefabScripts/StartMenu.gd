extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button2_button_down():
	$Credits.show()
	pass # Replace with function body.


func _on_Button2_button_up():
	$Credits.hide()
	pass # Replace with function body.
