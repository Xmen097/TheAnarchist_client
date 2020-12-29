extends ViewportContainer

export var DESIRED_RESOLUTION = Vector2(320, 180)
var scaling_factor = 0

onready var UI = $UI

func _ready():
	var _success = get_viewport().connect(
		"size_changed", self, "on_vp_size_change"
		)
	on_vp_size_change()
	assert(_success == 0, "Error: Camera failed to get lock on viewport!" + str(_success))

func on_vp_size_change():
	var scale_vector = get_viewport().size / DESIRED_RESOLUTION
	var new_scaling_factor = max(floor(min(scale_vector[0], scale_vector[1])), 1)
	# Only scale when there is a change
	if new_scaling_factor != scaling_factor:
		scaling_factor = new_scaling_factor
		Utils.scaling_factor = scaling_factor
		var vp_size = DESIRED_RESOLUTION * scaling_factor
		margin_left = -vp_size[0] / 2
		margin_right = vp_size[0] / 2
		margin_top = -vp_size[1] / 2
		margin_bottom = vp_size[1] / 2
		UI.rect_scale.x = scaling_factor
		UI.rect_scale.y = scaling_factor
