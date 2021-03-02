extends PanelContainer

enum states {
	NoBackpack,
	Backpack,
	Shop,
}
export(states) var state setget change_state
export(Array, NodePath) var nobackpack_nodes
export(Array, NodePath) var backpack_nodes
export(Array, NodePath) var shop_nodes
var state_nodes = [[], [], []]

func _input(event): #Call methods on hands on click event
	if visible and event.is_action_pressed("ui_cancel"):
		visible = false
	if event.is_action_pressed("open_inventory"):
		visible = !visible
	if event.is_action_pressed("open_shop") and visible and state != states.Shop:
		change_state(states.Shop)
	elif event.is_action_pressed("open_shop") and visible and state == states.Shop:
		change_state(states.Backpack)

func _ready():
	visible = false
	for path in nobackpack_nodes:
		state_nodes[0].append(path)
	for path in backpack_nodes:
		state_nodes[1].append(path)
	for path in shop_nodes:
		state_nodes[2].append(path)
		
func change_state(new_state):
	for node in state_nodes[state]:
		if get_node(node):
			get_node(node).visible = false
	for node in state_nodes[new_state]:
		if get_node(node):
			get_node(node).visible = true
	state = new_state
