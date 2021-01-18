extends Node

export(Array, NodePath) var node_paths = []
var nodes = []

var number = 0 setget update_number
var max_num
var nodes_num

export(int) var value_id

func update_number(new_number):
	number = new_number
	if number >= max_num and nodes_num >= 3 and false: # disabled
		var number_string = str(floor(number/1000)).pad_zeros(nodes_num)
		for num in range(nodes_num-1):
			nodes[num].texture.region = Rect2(int(number_string[num+1])*nodes[num].texture.region.size.x, 0, nodes[num].texture.region.size.x, nodes[num].texture.region.size.y)
		#nodes[nodes_num-1].texture.region = Rect2(36*5, 0, 5, 9) # letter k
	else:
		var number_string = str(number).pad_zeros(nodes_num)
		for num in range(nodes_num):
			nodes[num].texture.region = Rect2(int(number_string[num])*nodes[num].texture.region.size.x, 0, nodes[num].texture.region.size.x, nodes[num].texture.region.size.y)

func _ready():
	for path in node_paths:
		nodes.append(get_node(path))
	nodes_num = nodes.size()
	max_num = pow(10, nodes_num)
	update_number(number)
	var failed = GameManager.connect("stat_changed", self, "_on_stat_changed")
	assert(!failed, "Counter failed to connect to events!")

func _on_stat_changed(stat, value):
	if stat == value_id:
		update_number(value)
	
