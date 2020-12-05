extends Camera2D

export var DESIRED_RESOLUTION = Vector2(16*24, 9*24) # Setting aspect ration and minimum resolution
var viewport
var scaling_factor = 1 # how many times will we scale everyting

func _ready():
	viewport = get_viewport()
	viewport.connect(
		"size_changed", self, "on_vp_size_change"
	)
	on_vp_size_change()

func on_vp_size_change(): # Will be called on resize
	var scale_vector = viewport.size / DESIRED_RESOLUTION
	var new_scaling_factor = max(floor(min(scale_vector[0], scale_vector[1])), 1) # Vector, how many times will our minimum resolution fit inside viewport
	if new_scaling_factor != scaling_factor: # Scaling factor changed
		scaling_factor = new_scaling_factor
		zoom = Vector2(1 / scaling_factor, 1 / scaling_factor)
