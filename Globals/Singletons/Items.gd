extends Node

enum types {
	General,
	Head_armor,
	Arm_armor,
	Torso_armor,
	Leg_armor,
	Shoes,
	Weapon,
	Amulet,
	Usable,
}

var items = {
	None = Item.new(types.General, 0, "", ""),
	Obsidian_leggins = Armor.new(types.Leg_armor, 1, "Obsidianové kalhoty", "Kalhoty vyrobené z obsidianu"),
	Obsidian_chestplate = Armor.new(types.Torso_armor, 2, "Obsidianový hrudní štít", "Hrudní štít vyrobený z obsidianu"),
	Obsidian_armplate = Armor.new(types.Arm_armor, 3, "Obsidianový nárameník", "Nárameník vyrobený z obsidianu"),
	Obsidian_helmet = Armor.new(types.Head_armor, 4, "Obsidianová helma", "Helma vyrobená z obsidianu"),
	Diamond_leggins = Armor.new(types.Leg_armor, 5, "Diamantové kalhoty", "Kalhoty posázené diamany"),
	Diamond_chestplate = Armor.new(types.Torso_armor, 6, "Diamantový hrudní štít", "Hrudní štít posázený diamany"),
	Diamond_armplate = Armor.new(types.Arm_armor, 7, "Diamantový nárameník", "Nárameník posázený diamany"),
	Diamond_helmet = Armor.new(types.Head_armor, 8, "Diamantová helma", "Helma vyrobená diamany"),
	Golden_leggins = Armor.new(types.Leg_armor, 9, "Zlaté kalhoty", "Kalhoty vyrobené ze zlata"),
	Golden_chestplate = Armor.new(types.Torso_armor, 10, "Zlatý hrudní štít", "Hrudní štít vyrobený ze zlata"),
	Golden_armplate = Armor.new(types.Arm_armor, 11, "Zlatý nárameník", "Nárameník vyrobený ze zlata"),
	Golden_helmet = Armor.new(types.Head_armor, 12, "Zlatá helma", "Helma vyrobená ze zlata"),
	Steel_leggins = Armor.new(types.Leg_armor, 13, "Kovové kalhoty", "Kalhoty vyrobené z kovu"),
	Steel_chestplate = Armor.new(types.Torso_armor, 14, "Kovový hrudní štít", "Hrudní štít vyrobený z kovu"),
	Steel_armplate = Armor.new(types.Arm_armor, 15, "Kovový nárameník", "Nárameník vyrobený z kovu"),
	Steel_helmet = Armor.new(types.Head_armor, 16, "Kovová helma", "Helma vyrobená z kovu"),
	Makeshift_leggins = Armor.new(types.Leg_armor, 17, "Provizorní kalhoty", "Kalhoty vyrobené z toho, co se doma našlo"),
	Makeshift_chestplate = Armor.new(types.Torso_armor, 18, "Provizorní hrudní štít", "Hrudní štít vyrobený z toho, co se doma našlo"),
	Makeshift_armplate = Armor.new(types.Arm_armor, 19, "Provizorní nárameník", "Nárameník vyrobený z toho, co se doma našlo"),
	Makeshift_helmet = Armor.new(types.Head_armor, 20, "Provizorní helma", "Helma vyrobená z toho, co se doma našlo"),
	Moss_leggins = Armor.new(types.Leg_armor, 21, "Lišejníkové kalhoty", "Kalhoty porostlé lišejníkem"),
	Moss_chestplate = Armor.new(types.Torso_armor, 22, "Lišejníkový hrudní štít", "Hrudní štít porostlý lišejníkem"),
	Moss_armplate = Armor.new(types.Arm_armor, 23, "Lišejníkový nárameník", "Nárameník porostlý lišejníkem"),
	Moss_helmet = Armor.new(types.Head_armor, 24, "Lišejníková helma", "Helma porostlá lišejníkem"),
	Leather_shoes = Item.new(types.Shoes, 25, "Kožené boty", ""),
	Cutlass = Item.new(types.Weapon, 26, "Šavle", ""),
	Necklace = Item.new(types.Amulet, 27, "Smaragdový náhrdelník", ""),
	Acid = Item.new(types.Usable, 28, "Šmahajova kyselinka", ""),
}

class Item:
	var type = types.General
	var id = -1
	var tooltip = ""
	var description = ""
	
	func _init(new_type, new_id, new_tooltip, new_description):
		self.type = new_type
		self.id = new_id
		self.tooltip = new_tooltip
		self.description = new_description

class Armor extends Item:
	
	func _init(new_type, new_id, new_tooltip, new_description).(new_type, new_id, new_tooltip, new_description):
		pass
	
