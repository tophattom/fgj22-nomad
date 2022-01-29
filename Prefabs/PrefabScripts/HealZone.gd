#We are coming out of the asteroid field

extends Area

export var hunger = false
export var thirst = false
export var injury = false
export var poison = false
#var active = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HealZone_body_entered(body):
	print(body)
	if body.name != "CharacterGroup":
		return
	
	print ("heal_zone")
	#if(!active):
	#	print("notactive")
	#	return
	
	if (hunger):
		body.heal_hunger()
	if (thirst):
		body.heal_thirst()
	if (injury):
		body.heal_injury()
	if (poison):
		body.heal_poison()
		
	#active = false
	
	pass # Replace with function body.
