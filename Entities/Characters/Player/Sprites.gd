extends Node2D

export var frame = Vector2(0,0) setget change_frame
export var flip_h = false setget change_flip_h

export(Array, NodePath) var node_paths = []
var nodes = []

func _ready():
	for path in node_paths:
		nodes.append(get_node(path))

func change_frame(new_value):
	for node in nodes:
		node.frame_coords = new_value
		
func change_flip_h(new_value):
	for node in nodes:
		node.flip_h = new_value

