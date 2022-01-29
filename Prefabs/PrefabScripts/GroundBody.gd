extends StaticBody

# func _ready():
# 	var hm = $MeshInstance.get_surface_material(0).get_shader_param("noise")
	
# 	yield(hm, "changed")
	
# 	var noise = hm.noise
	
# 	var coll = $GroundCollision
# 	coll.shape = HeightMapShape.new()
# 	coll.shape.map_width = hm.height
# 	coll.shape.map_depth = hm.width

# 	var data = PoolRealArray()
# 	for y in hm.get_height():
# 		for x in hm.get_width():
# 			data.append(noise.get_noise_2d(x, y) * 10)
# 	coll.shape.map_data = data
