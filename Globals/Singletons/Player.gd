extends Node2D

var player_ref

var hotbar = []
var inventory = []
var body = []
enum frame_type {Inventory, Hotbar, Body, Backpack, Trash}
signal item_changed(new_item, id, type)
signal item_hovered(item, id, type)
signal armor_changed(armor_type, id)

var armor = {
	head = Items.armor_type.None,
	left_arm = Items.armor_type.None,
	right_arm = Items.armor_type.None,
	left_leg = Items.armor_type.None,
	right_leg = Items.armor_type.None,
	torso = Items.armor_type.None,
}

var body_health = {
	head = 150,
	left_arm = 100,
	right_arm = 100,
	left_leg = 200,
	right_leg = 200,
	torso = 500,
}

var stats = {
	vulnerable = true
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
	if not stats.vulnerable:
		return
	var possible_targets = []
	for i in range(6): # stab for every externality except torso
		if armor[armor.keys()[i]] != Items.armor_type.Destroyed and armor.keys()[i] != "torso":
			possible_targets.append(i)
			
	if possible_targets:
		var hit_target = possible_targets[floor(rand_range(0, len(possible_targets)))]
		
		if armor[target_key] == Items.armor_type.None: # no armor
			body_health[target_key] -= damage
			emit_signal("body_damaged", body_health[target_key], hit_target)
			if body_health[target_key] <= 0:
				armor[target_key] = Items.armor_type.Destroyed
				emit_signal("armor_changed", Items.armor_type.Destroyed, hit_target)
		elif armor[target_key] != Items.armor_type.Destroyed: # has armor
			body[hit_target].durability -= damage
			emit_signal("armor_damaged", body[hit_target].durability, hit_target)
			if body[hit_target].durability <= 0:
				_on_item_changed(Items.items.None, hit_target, frame_type.Body);
			
func stab(damage):
	if not stats.vulnerable:
		return
	var torso_id = armor.keys().find("torso", 0)
	if armor.torso == Items.armor_type.None: # no armor
		body_health.torso -= damage
		emit_signal("body_damaged", body_health.torso, torso_id)
		if body_health.torso <= 0:
			armor.torso = Items.armor_type.Destroyed
			emit_signal("armor_changed", Items.armor_type.Destroyed, torso_id)
	elif armor.body != Items.armor_type.Destroyed: # has armor
		body.body.durability -= damage
		emit_signal("armor_damaged", body.body.durability, torso_id)
		if body.body.durability <= 0:
			_on_item_changed(Items.items.None, torso_id, frame_type.Body);
	
