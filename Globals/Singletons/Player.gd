extends Node2D

var player_ref

var hotbar = []
var inventory = []
var body = []
enum frame_type {Inventory, Hotbar, Body}
signal item_changed(new_item, id, type)


func _init():
	for _a in range(7):
		hotbar.append(Items.items.None)
	for _a in range(20):
		inventory.append(Items.items.None)
	for _a in range(10):
		body.append(Items.items.None)

func get_reference():
	return player_ref

func _on_item_changed(new_item, id, type):
	if type == frame_type.Hotbar:
		hotbar[id] = new_item
	elif type == frame_type.Inventory:
		inventory[id] = new_item
	elif type == frame_type.Body:
		body[id] = new_item
	emit_signal("item_changed", new_item, id, type);
