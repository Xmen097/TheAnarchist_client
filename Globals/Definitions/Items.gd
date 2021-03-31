extends Node

onready var throwable_instance = preload("res://Entities/Objects/Throwables/Throwable/Throwable.tscn")

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

func props(cost=0, tooltip=null):
	if tooltip == null:
		tooltip = []
	return {"cost": cost, "tooltip": tooltip}

var items = {
	None = Item.new(types.General, 0, [], 0),
	Obsidian_leggins = Armor.new(types.Leg_armor, 1, [], 250, armor_type.Obsidian, 300),
	Obsidian_chestplate = Armor.new(types.Torso_armor, 2, [], 0, armor_type.Obsidian, 300),
	Obsidian_armplate = Armor.new(types.Arm_armor, 3, [], 0, armor_type.Obsidian, 300),
	Obsidian_helmet = Armor.new(types.Head_armor, 4, [], 0, armor_type.Obsidian, 300),
	Diamond_leggins = Armor.new(types.Leg_armor, 5, [], 0, armor_type.Diamond, 250),
	Diamond_chestplate = Armor.new(types.Torso_armor, 6, [], 0, armor_type.Diamond, 250),
	Diamond_armplate = Armor.new(types.Arm_armor, 7, [], 0, armor_type.Diamond, 250),
	Diamond_helmet = Armor.new(types.Head_armor, 8, [], 0, armor_type.Diamond, 250),
	Golden_leggins = Armor.new(types.Leg_armor, 9, [], 0, armor_type.Golden, 200),
	Golden_chestplate = Armor.new(types.Torso_armor, 10, [], 0, armor_type.Golden, 200),
	Golden_armplate = Armor.new(types.Arm_armor, 11, [], 0, armor_type.Golden, 200),
	Golden_helmet = Armor.new(types.Head_armor, 12, [], 0, armor_type.Golden, 200),
	Steel_leggins = Armor.new(types.Leg_armor, 13, [], 0, armor_type.Steel, 150),
	Steel_chestplate = Armor.new(types.Torso_armor, 14, [], 0, armor_type.Steel, 150),
	Steel_armplate = Armor.new(types.Arm_armor, 15, [], 0, armor_type.Steel, 150),
	Steel_helmet = Armor.new(types.Head_armor, 16, [], 0, armor_type.Steel, 150),
	Makeshift_leggins = Armor.new(types.Leg_armor, 17, [], 0, armor_type.Makeshift, 50),
	Makeshift_chestplate = Armor.new(types.Torso_armor, 18, [], 0, armor_type.Makeshift, 50),
	Makeshift_armplate = Armor.new(types.Arm_armor, 19, [], 0, armor_type.Makeshift, 50),
	Makeshift_helmet = Armor.new(types.Head_armor, 20, [], 0, armor_type.Makeshift, 50),
	Moss_leggins = Armor.new(types.Leg_armor, 21, [], 0, armor_type.Moss, 100),
	Moss_chestplate = Armor.new(types.Torso_armor, 22, [], 0, armor_type.Moss, 100),
	Moss_armplate = Armor.new(types.Arm_armor, 23, [], 0, armor_type.Moss, 100),
	Moss_helmet = Armor.new(types.Head_armor, 24, [], 0, armor_type.Moss, 100),
	Leather_shoes = Item.new(types.Shoes, 25, [], 0),
	Cutlass = Weapon.new(types.Weapon, 26, [], 0, Weapons.weapons.Cutlass),
	Bow = Weapon.new(types.Weapon, 78, [], 0, Weapons.weapons.Bow),
	Halberd = Weapon.new(types.Weapon, 79, [], 0, Weapons.weapons.Halberd),
	Necklace = Item.new(types.Amulet, 27, [], 0),
	Medkit = Usables.Medkit.new(types.Usable, 28, [], 0),
	Drug = Usables.Drug.new(types.Usable, 45, [], 0),
	Stone = Throwables.Stone.new(types.Usable, 31, [], 0),
	Cyanite = Usables.Cyanite.new(types.Usable, 44, [], 0),
	Reptail = Usables.Reptail.new(types.Usable, 33, [], 0),
	Drug2 = Usables.Drug.new(types.Usable, 34, [], 0),
	Beer = Usables.Beer.new(types.Usable, 35, [], 0),
	Chocolate = Usables.Chocolate.new(types.Usable, 36, [], 0),
	FlaskGreen = Throwables.FlaskGreen.new(types.Usable, 37, [], 0),
	FlaskRed = Throwables.FlaskRed.new(types.Usable, 38, [], 0),
	BananaPeel = Throwables.BananaPeel.new(types.Usable, 47, [], 0),
	CauldronRed = Throwables.CauldronRed.new(types.Usable, 55, [], 0),
	CauldronGreen = Throwables.CauldronGreen.new(types.Usable, 59, [], 0),
	CauldronHand = Throwables.CauldronHand.new(types.Usable, 60, [], 0),
	Molotov = Throwables.Molotov.new(types.Usable, 76, [], 0),
	Carrot = Usables.Carrot.new(types.Usable, 43, [], 0),
}
