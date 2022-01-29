extends Spatial


var health = 100.0
var hungry = false
var thirsty = false
var injured = false
var poisoned = false

var hungry_rate = 20
var thirsty_rate = 20
var injured_rate = 2
var poisoned_rate = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapseyd time since the previous frame.
func _process(delta):
	if (hungry):
		health -= hungry_rate*delta
		#print (hungry)
		#print (health)
	if (thirsty):
		#print (thirsty)
		#print (health)
		health -= thirsty_rate*delta
	if (injured):
		health -= injured_rate*delta
	if (poisoned):
		health -= poisoned_rate*delta

	if (health < 0 ):
		print ("GAME OVER!")

#	pass
