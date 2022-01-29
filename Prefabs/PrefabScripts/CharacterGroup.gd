extends KinematicBody

export var speed = 5
export var turn_speed = 0.1

var velocity = Vector3.ZERO
var heading = 0.0

var character_array = [$Player1, $Player2, $Player3]
var character_index = -1

func _ready():
	character_array[0] = $Player1
	#print (character_array[0])
	character_array[1] = $Player2
	character_array[2] = $Player3

func give_character():
	character_index += 1
	print (character_array[character_index])
	return character_array[character_index]

func _physics_process(delta):
	if Input.is_action_pressed("turn_left"):
		heading -= turn_speed
	if Input.is_action_pressed("turn_right"):
		heading += turn_speed

	var dir = Vector3(cos(heading), 0, sin(heading)).normalized()
	$Pivot.look_at(translation + dir, Vector3.UP)
	
	if Input.is_action_pressed("move_forward"):
		velocity = dir * speed
		velocity = move_and_slide(velocity, Vector3.UP)
		
		
	
func thirst():
	$Player1.thirsty = true
	
func hunger():
	$Player2.hungry = true
	
func poison():
	$Player3.poisoned = true
	
func injury():
	$Player3.injured = true
