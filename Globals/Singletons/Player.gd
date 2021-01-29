extends Node2D

var player_ref

var hotbar = []
var inventory = []
var body = []
enum frame_type {Inventory, Hotbar, Body, Backpack}
signal item_changed(new_item, id, type)
signal item_hovered(item, id, type)
signal armor_changed(armor_type, id)

var armor = {
	head = Items.armor_type.None,
	left_arm = Items.armor_type.None,
	right_arm = Items.armor_type.None,
	torso = Items.armor_type.None,
	left_leg = Items.armor_type.None,
	right_leg = Items.armor_type.None,
}


func _init():
	for _a in range(7):
		hotbar.append(Items.items.None)
	for _a in range(20):
		inventory.append(Items.items.None)
	for _a in range(10):
		body.append(Items.items.None)
	randomize() # generate a new global seed
 
func get_reference(): # returns reference to Player gameobject (not this script)
	return player_ref

func _on_item_changed(new_item, id, type): # called from inventory_frames and other places
	if type == frame_type.Hotbar:
		hotbar[id] = new_item
	elif type == frame_type.Inventory:
		inventory[id] = new_item
	elif type == frame_type.Body:
		body[id] = new_item
		if new_item == Items.items.None:
			armor[armor.keys()[id]] = Items.armor_type.None
			emit_signal("armor_changed", Items.armor_type.None, id)
		else:
			armor[armor.keys()[id]] = new_item.armor_type
			emit_signal("armor_changed", new_item.armor_type, id)
	
	emit_signal("item_changed", new_item, id, type)
	
func swing(damage): # will be called from Player gameobject (not this script)
	var possible_targets = []
	for i in range(6):
		if armor[armor.keys()[i]] != Items.armor_type.Destroyed:
			possible_targets.append(i)
			
	var hit_target = possible_targets[floor(rand_range(0, len(possible_targets)))]
	
	if armor[armor.keys()[hit_target]] == Items.armor_type.None:
		armor[armor.keys()[hit_target]] = Items.armor_type.Destroyed
		emit_signal("armor_changed", Items.armor_type.Destroyed, hit_target)
	elif armor[armor.keys()[hit_target]] != Items.armor_type.Destroyed:
		body[hit_target].durability -= damage
		if body[hit_target].durability <= 0:
			_on_item_changed(Items.items.None, hit_target, frame_type.Body);
			
func stab(damage):
	pass
	
