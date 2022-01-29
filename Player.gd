extends KinematicBody

export var speed = 5
export var turn_speed = 0.1

var velocity = Vector3.ZERO
var heading = 0.0

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
		
		
	
