extends KinematicBody

var rng = RandomNumberGenerator.new()

export var speed = 5
export var turn_speed = 0.1

var velocity = Vector3.ZERO
var heading = 0.0

var character_array = [null, null, null]
var character_index = -1
var SFXplayer = AudioStreamPlayer.new()
var footstep_player = AudioStreamPlayer.new()

export(AudioStream) var SFXthirst
export(AudioStream) var SFXhunger
export(AudioStream) var SFXpoison
export(AudioStream) var SFXinjury
export(AudioStream) var SFXrelief
export(AudioStream) var SFXsteps

func _ready():
	rng.randomize()
	character_array[0] = $Player1
	#print (character_array[0])
	character_array[1] = $Player2
	character_array[2] = $Player3
	add_child(SFXplayer)
	add_child(footstep_player)
	footstep_player.set_stream(SFXsteps)

func give_character():
	character_index += 1
	print (character_array[character_index])
	return character_array[character_index]

func _physics_process(_delta):
	if Input.is_action_pressed("turn_left"):
		heading -= turn_speed
	if Input.is_action_pressed("turn_right"):
		heading += turn_speed

	var dir = Vector3(cos(heading), 0, sin(heading)).normalized()
	$Pivot.look_at(translation + dir, Vector3.UP)
	
	if Input.is_action_pressed("move_forward"):
		if(!footstep_player.playing):
			footstep_player.play()
		velocity = dir * speed
		velocity = move_and_slide(velocity, Vector3.UP)
	else:
		footstep_player.stop()
		
	
func thirst():
	character_array[rng.randi_range(0,2)].thirsty = true
	SFXplayer.set_stream(SFXthirst)
	SFXplayer.play()
	
func hunger():
	character_array[rng.randi_range(0,2)].hungry = true
	SFXplayer.set_stream(SFXhunger)
	SFXplayer.play()
	
func poison():
	character_array[rng.randi_range(0,2)].poisoned = true
	SFXplayer.set_stream(SFXpoison)
	SFXplayer.play()
	
func injury():
	character_array[rng.randi_range(0,2)].injured = true
	SFXplayer.set_stream(SFXinjury)
	SFXplayer.play()
	
func heal_thirst():
	print ("HEALING!")
	for character in character_array:
		if (character.thirsty):
			SFXplayer.set_stream(SFXrelief)
			SFXplayer.play()
			print ("healed")
			character.health += 25
			if (character.health > 100):
				character.health = 100
			character.thirsty = false

func heal_hunger():
	for character in character_array:
		if (character.hungry):
			SFXplayer.set_stream(SFXrelief)
			SFXplayer.play()
			character.health += 25
			if (character.health > 100):
				character.health = 100
			character.hungry = false

func heal_poison():
	for character in character_array:
		if (character.poisoned):
			SFXplayer.set_stream(SFXrelief)
			SFXplayer.play()
			character.health += 25
			if (character.health > 100):
				character.health = 100
			character.poisoned = false

func heal_injury():
	for character in character_array:
		if (character.injured):
			SFXplayer.set_stream(SFXrelief)
			SFXplayer.play()
			character.health += 25
			if (character.health > 100):
				character.health = 100
			character.injured = false


