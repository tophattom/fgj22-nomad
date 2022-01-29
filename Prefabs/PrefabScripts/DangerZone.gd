#Volleyball Time!

extends Area

export var hunger = false
export var thirst = false
export var injury = false
export var poison = false
var active = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DangerZone_body_entered(body):
	print(body)
	if body.name != "CharacterGroup":
		return

	if(!active):
		print("notactive")
		return
	
	if (hunger):
		body.hunger()
	if (thirst):
		body.thirst()
	if (injury):
		body.injury()
	if (poison):
		body.poison()
		
	active = false
	
	pass # Replace with function body.
