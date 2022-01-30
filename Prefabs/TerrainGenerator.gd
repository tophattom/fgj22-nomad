extends Node

export var amount = 10000
export var max_distance = 1000
export(Array, PackedScene) var dec_array

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	print (dec_array[0])
	pass # Replace with function body.

func generate():
	for i in amount:
		var index = rng.randi_range(0, dec_array.size() - 1)
		var x_coord = rng.randf_range(0, max_distance)
		var y_coord = rng.randf_range(0, max_distance)
		var new_scene = dec_array[index]
		if (new_scene) == null:
			print("skip")
			continue
		var new_item = new_scene.instance()
		new_item.translation = Vector3(x_coord, 0, y_coord)
		add_child(new_item)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
