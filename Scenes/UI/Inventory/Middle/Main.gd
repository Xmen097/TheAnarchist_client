extends VBoxContainer



export(Array, NodePath) var lines_paths
var lines = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var success = false #connect to events
	success = success or Player.connect("backpack_changed", self, "_on_backpack_changed")
	assert(!success, "Main middle inventory failed to connect to events!")
	for a in range(3):
		lines.append(get_node(lines_paths[a]))

func _on_backpack_changed(grade):
	for a in range(3):
		lines[a].visible = a < grade
