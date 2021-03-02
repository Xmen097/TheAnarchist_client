extends Node2D

var player_ref

var items = {
	hotbar = [],
	inventory = [],
	body = [],
	hands = [],
}

enum frame_type {Inventory, Hotbar, Body, Backpack, Trash, Shop, Weapon, Amulet, Shoes}
signal item_changed(new_item, id, type)
signal item_hovered(item, id, type)
signal armor_changed(body_part) # on change of armor, or destroy
signal armor_damaged(body_part) # decrease of durability of armor
signal body_damaged(body_part) # decrease of durability of body part
signal weapon_changed(weapon) # on weapon change

var body = {
	head = {health = 150, max_health = 150, armor = Items.armor_type.None, id="head", item_id=0 },
	left_arm = {health = 100, max_health = 100, armor = Items.armor_type.None, id="left_arm", item_id=1 },
	right_arm = {health = 100, max_health = 100, armor = Items.armor_type.None, id="right_arm", item_id=2 },
	torso = {health = 500, max_health = 500, armor = Items.armor_type.None, id="torso", item_id=3 },
	left_leg = {health = 200, max_health = 200, armor = Items.armor_type.None, id="left_leg", item_id=4 },
	right_leg = {health = 200, max_health = 200, armor = Items.armor_type.None, id="right_leg", item_id=5 },
}

var stats = {
	vulnerable = true,
	flag = false
}


func _init():
	for _a in range(7):
		items.hotbar.append(Items.items.None)
	for _a in range(20):
		items.inventory.append(Items.items.None)
	for _a in range(10):
		items.body.append(Items.items.None)
	for _a in range(2):
		items.hands.append(Weapons.weapons.None)
	randomize() # generate a new global seed
 
func get_reference(): # returns reference to Player gameobject (not this script)
	return player_ref

func _on_item_changed(new_item, id, type): # called from inventory_frames and other places
	if type == frame_type.Hotbar:
		items.hotbar[id] = new_item
	elif type == frame_type.Inventory:
		items.inventory[id] = new_item
	elif type == frame_type.Weapon:
		if new_item != Items.items.None:
			emit_signal("weapon_changed", new_item.weapon)
		else:
			emit_signal("weapon_changed", Weapons.weapons.None)
	elif type == frame_type.Body:
		items.body[id] = new_item
		if new_item == Items.items.None:
			body[body.keys()[id]].armor = Items.armor_type.None
			emit_signal("armor_changed", body[body.keys()[id]])
		else:
			body[body.keys()[id]].armor = new_item.armor_type
			emit_signal("armor_changed", body[body.keys()[id]])
	
	emit_signal("item_changed", new_item, id, type)
	
func on_body_damaged(body_part):
	emit_signal("body_damaged", body_part)
	
func swing(damage): # will be called from Player gameobject (not this script)
	if not stats.vulnerable:
		return
	var possible_targets = []
	for i in range(6): # stab for every externality except torso
		if body[body.keys()[i]].armor != Items.armor_type.Destroyed and body.keys()[i] != "torso":
			possible_targets.append(i)
			
	if possible_targets:
		var hit_target = possible_targets[floor(rand_range(0, len(possible_targets)))]
		var target_key = body.keys()[hit_target]
		
		if body[target_key].armor == Items.armor_type.None: # no armor
			body[target_key].health -= damage
			emit_signal("body_damaged", body[target_key])
			if body[target_key].health <= 0:
				body[target_key].armor = Items.armor_type.Destroyed
				emit_signal("armor_changed", body[target_key])
		elif body[target_key].armor != Items.armor_type.Destroyed: # has armor
			items.body[hit_target].durability -= damage
			emit_signal("armor_damaged", body[target_key])
			if items.body[hit_target].durability <= 0:
				_on_item_changed(Items.items.None, hit_target, frame_type.Body);
			
func stab(damage):
	if not stats.vulnerable:
		return
	var torso_id = body.keys().find("torso", 0)
	if body.torso.armor == Items.armor_type.None: # no armor
		body.torso.health -= damage
		emit_signal("body_damaged", body.torso)
		if body.torso.health <= 0:
			body.torso.armor = Items.armor_type.Destroyed
			emit_signal("armor_changed", body.torso)
	elif body.torso.armor != Items.armor_type.Destroyed: # has armor
		items.body[torso_id].durability -= damage
		emit_signal("armor_damaged", body.torso)
		if items.body[torso_id].durability <= 0:
			_on_item_changed(Items.items.None, torso_id, frame_type.Body);
	
