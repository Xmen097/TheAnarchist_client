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

enum armor_type {
	None,
	Moss,
	Makeshift,
	Steel,
	Golden,
	Diamond,
	Obsidian,
}

var items = {
	None = Item.new(types.General, 0, "", ""),
	Obsidian_leggins = Armor.new(types.Leg_armor, 1, "Obsidianové kalhoty", "", armor_type.Obsidian),
	Obsidian_chestplate = Armor.new(types.Torso_armor, 2, "Obsidianový hrudní štít", "", armor_type.Obsidian),
	Obsidian_armplate = Armor.new(types.Arm_armor, 3, "Obsidianový nárameník", "", armor_type.Obsidian),
	Obsidian_helmet = Armor.new(types.Head_armor, 4, "Obsidianová helma", "", armor_type.Obsidian),
	Diamond_leggins = Armor.new(types.Leg_armor, 5, "Diamantové kalhoty", "", armor_type.Diamond),
	Diamond_chestplate = Armor.new(types.Torso_armor, 6, "Diamantový hrudní štít", "", armor_type.Diamond),
	Diamond_armplate = Armor.new(types.Arm_armor, 7, "Diamantový nárameník", "", armor_type.Diamond),
	Diamond_helmet = Armor.new(types.Head_armor, 8, "Diamantová helma", "", armor_type.Diamond),
	Golden_leggins = Armor.new(types.Leg_armor, 9, "Zlaté kalhoty", "", armor_type.Golden),
	Golden_chestplate = Armor.new(types.Torso_armor, 10, "Zlatý hrudní štít", "", armor_type.Golden),
	Golden_armplate = Armor.new(types.Arm_armor, 11, "Zlatý nárameník", "", armor_type.Golden),
	Golden_helmet = Armor.new(types.Head_armor, 12, "Zlatá helma", "", armor_type.Golden),
	Steel_leggins = Armor.new(types.Leg_armor, 13, "Kovové kalhoty", "", armor_type.Steel),
	Steel_chestplate = Armor.new(types.Torso_armor, 14, "Kovový hrudní štít", "", armor_type.Steel),
	Steel_armplate = Armor.new(types.Arm_armor, 15, "Kovový nárameník", "", armor_type.Steel),
	Steel_helmet = Armor.new(types.Head_armor, 16, "Kovová helma", "", armor_type.Steel),
	Makeshift_leggins = Armor.new(types.Leg_armor, 17, "Provizorní kalhoty", "", armor_type.Makeshift),
	Makeshift_chestplate = Armor.new(types.Torso_armor, 18, "Provizorní hrudní štít", "", armor_type.Makeshift),
	Makeshift_armplate = Armor.new(types.Arm_armor, 19, "Provizorní nárameník", "", armor_type.Makeshift),
	Makeshift_helmet = Armor.new(types.Head_armor, 20, "Provizorní helma", "", armor_type.Makeshift),
	Moss_leggins = Armor.new(types.Leg_armor, 21, "Lišejníkové kalhoty", "", armor_type.Moss),
	Moss_chestplate = Armor.new(types.Torso_armor, 22, "Lišejníkový hrudní štít", "", armor_type.Moss),
	Moss_armplate = Armor.new(types.Arm_armor, 23, "Lišejníkový nárameník", "", armor_type.Moss),
	Moss_helmet = Armor.new(types.Head_armor, 24, "Lišejníková helma", "", armor_type.Moss),
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
	var armor_type
	func _init(new_type, new_id, new_tooltip, new_description, new_armor_type).(new_type, new_id, new_tooltip, new_description):
		self.armor_type = new_armor_type
	
