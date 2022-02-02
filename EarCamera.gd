extends Camera

export(NodePath) var followed_entity_nodepath
export var min_distance = 5.0
var followed = null

var camera_vector = Vector3(0,0,0)
var mouse_wheel_counter = 0
var right_mouse = false

var mouse_sensitivity = 0.02
#var old_mouse_position = Vector2

func _ready():
	yield(get_tree(), "idle_frame") # Wait for initializations
	followed = get_node(followed_entity_nodepath)
	if followed:
		camera_vector = translation - followed.translation

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#follow object
	if followed:
		translation = followed.translation + camera_vector

	# Zoom
	if (mouse_wheel_counter != 0):
		if (camera_vector.length() > min_distance || mouse_wheel_counter > 0):
			camera_vector += camera_vector.normalized() * mouse_wheel_counter
		mouse_wheel_counter = 0
	# Rotate with right mouse
	

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT:
			if event.pressed:
				right_mouse = true
			else:
				right_mouse = false
		
		if event.button_index == BUTTON_WHEEL_DOWN:
			print("Wheel down")
			mouse_wheel_counter += 1
			
		if event.button_index == BUTTON_WHEEL_UP:
			mouse_wheel_counter += -1
		
	if event is InputEventMouseMotion:
		if right_mouse:
			camera_vector = camera_vector.rotated(Vector3(1,0,0), -event.relative.y * mouse_sensitivity)
			rotation.x += -event.relative.y * mouse_sensitivity
