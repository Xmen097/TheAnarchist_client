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
	Destroyed,
	Moss,
	Makeshift,
	Steel,
	Golden,
	Diamond,
	Obsidian,
}

var items = {
	None = Item.new(types.General, 0, "", ""),
	Obsidian_leggins = Armor.new(types.Leg_armor, 1, "Obsidianové kalhoty", "", armor_type.Obsidian, 300),
	Obsidian_chestplate = Armor.new(types.Torso_armor, 2, "Obsidianový hrudní štít", "", armor_type.Obsidian, 300),
	Obsidian_armplate = Armor.new(types.Arm_armor, 3, "Obsidianový nárameník", "", armor_type.Obsidian, 300),
	Obsidian_helmet = Armor.new(types.Head_armor, 4, "Obsidianová helma", "", armor_type.Obsidian, 300),
	Diamond_leggins = Armor.new(types.Leg_armor, 5, "Diamantové kalhoty", "", armor_type.Diamond, 250),
	Diamond_chestplate = Armor.new(types.Torso_armor, 6, "Diamantový hrudní štít", "", armor_type.Diamond, 250),
	Diamond_armplate = Armor.new(types.Arm_armor, 7, "Diamantový nárameník", "", armor_type.Diamond, 250),
	Diamond_helmet = Armor.new(types.Head_armor, 8, "Diamantová helma", "", armor_type.Diamond, 250),
	Golden_leggins = Armor.new(types.Leg_armor, 9, "Zlaté kalhoty", "", armor_type.Golden, 200),
	Golden_chestplate = Armor.new(types.Torso_armor, 10, "Zlatý hrudní štít", "", armor_type.Golden, 200),
	Golden_armplate = Armor.new(types.Arm_armor, 11, "Zlatý nárameník", "", armor_type.Golden, 200),
	Golden_helmet = Armor.new(types.Head_armor, 12, "Zlatá helma", "", armor_type.Golden, 200),
	Steel_leggins = Armor.new(types.Leg_armor, 13, "Kovové kalhoty", "", armor_type.Steel, 150),
	Steel_chestplate = Armor.new(types.Torso_armor, 14, "Kovový hrudní štít", "", armor_type.Steel, 150),
	Steel_armplate = Armor.new(types.Arm_armor, 15, "Kovový nárameník", "", armor_type.Steel, 150),
	Steel_helmet = Armor.new(types.Head_armor, 16, "Kovová helma", "", armor_type.Steel, 150),
	Makeshift_leggins = Armor.new(types.Leg_armor, 17, "Provizorní kalhoty", "", armor_type.Makeshift, 50),
	Makeshift_chestplate = Armor.new(types.Torso_armor, 18, "Provizorní hrudní štít", "", armor_type.Makeshift, 50),
	Makeshift_armplate = Armor.new(types.Arm_armor, 19, "Provizorní nárameník", "", armor_type.Makeshift, 50),
	Makeshift_helmet = Armor.new(types.Head_armor, 20, "Provizorní helma", "", armor_type.Makeshift, 50),
	Moss_leggins = Armor.new(types.Leg_armor, 21, "Lišejníkové kalhoty", "", armor_type.Moss, 100),
	Moss_chestplate = Armor.new(types.Torso_armor, 22, "Lišejníkový hrudní štít", "", armor_type.Moss, 100),
	Moss_armplate = Armor.new(types.Arm_armor, 23, "Lišejníkový nárameník", "", armor_type.Moss, 100),
	Moss_helmet = Armor.new(types.Head_armor, 24, "Lišejníková helma", "", armor_type.Moss, 100),
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
		
	func duplicate():
		var dup = Item.new(self.type, self.id, self.tooltip, self.description)
		return dup

class Armor extends Item:
	var armor_type
	var durability
	var max_durability
	func _init(new_type, new_id, new_tooltip, new_description, new_armor_type, new_durability).(new_type, new_id, new_tooltip, new_description):
		self.armor_type = new_armor_type
		self.durability = new_durability
		self.max_durability = new_durability
		
	func duplicate():
		var dup = Armor.new(self.type, self.id, self.tooltip, self.description, self.armor_type, self.durability)
		return dup
