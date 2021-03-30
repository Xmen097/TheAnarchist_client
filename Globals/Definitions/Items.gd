extends Node

onready var throwable_instance = preload("res://Entities/Objects/Throwable/Throwable.tscn")

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
	None = Item.new(types.General, 0, props()),
	Obsidian_leggins = Armor.new(types.Leg_armor, 1, props(250), armor_type.Obsidian, 300),
	Obsidian_chestplate = Armor.new(types.Torso_armor, 2, props(), armor_type.Obsidian, 300),
	Obsidian_armplate = Armor.new(types.Arm_armor, 3, props(), armor_type.Obsidian, 300),
	Obsidian_helmet = Armor.new(types.Head_armor, 4, props(), armor_type.Obsidian, 300),
	Diamond_leggins = Armor.new(types.Leg_armor, 5, props(), armor_type.Diamond, 250),
	Diamond_chestplate = Armor.new(types.Torso_armor, 6, props(), armor_type.Diamond, 250),
	Diamond_armplate = Armor.new(types.Arm_armor, 7, props(), armor_type.Diamond, 250),
	Diamond_helmet = Armor.new(types.Head_armor, 8, props(), armor_type.Diamond, 250),
	Golden_leggins = Armor.new(types.Leg_armor, 9, props(), armor_type.Golden, 200),
	Golden_chestplate = Armor.new(types.Torso_armor, 10, props(), armor_type.Golden, 200),
	Golden_armplate = Armor.new(types.Arm_armor, 11, props(), armor_type.Golden, 200),
	Golden_helmet = Armor.new(types.Head_armor, 12, props(), armor_type.Golden, 200),
	Steel_leggins = Armor.new(types.Leg_armor, 13, props(), armor_type.Steel, 150),
	Steel_chestplate = Armor.new(types.Torso_armor, 14, props(), armor_type.Steel, 150),
	Steel_armplate = Armor.new(types.Arm_armor, 15, props(), armor_type.Steel, 150),
	Steel_helmet = Armor.new(types.Head_armor, 16, props(), armor_type.Steel, 150),
	Makeshift_leggins = Armor.new(types.Leg_armor, 17, props(), armor_type.Makeshift, 50),
	Makeshift_chestplate = Armor.new(types.Torso_armor, 18, props(), armor_type.Makeshift, 50),
	Makeshift_armplate = Armor.new(types.Arm_armor, 19, props(), armor_type.Makeshift, 50),
	Makeshift_helmet = Armor.new(types.Head_armor, 20, props(), armor_type.Makeshift, 50),
	Moss_leggins = Armor.new(types.Leg_armor, 21, props(), armor_type.Moss, 100),
	Moss_chestplate = Armor.new(types.Torso_armor, 22, props(), armor_type.Moss, 100),
	Moss_armplate = Armor.new(types.Arm_armor, 23, props(), armor_type.Moss, 100),
	Moss_helmet = Armor.new(types.Head_armor, 24, props(), armor_type.Moss, 100),
	Leather_shoes = Item.new(types.Shoes, 25, props()),
	Cutlass = Weapon.new(types.Weapon, 26, props(), Weapons.weapons.Cutlass),
	Bow = Weapon.new(types.Weapon, 78, props(), Weapons.weapons.Bow),
	Halberd = Weapon.new(types.Weapon, 79, props(), Weapons.weapons.Halberd),
	Necklace = Item.new(types.Amulet, 27, props()),
	Medkit = Usables.Medkit.new(types.Usable, 28, props()),
	Drug = Usables.Drug.new(types.Usable, 45, props()),
	Stone = Throwables.Stone.new(types.Usable, 31, props()),
	Cyanite = Usables.Cyanite.new(types.Usable, 44, props()),
	Reptail = Usables.Reptail.new(types.Usable, 33, props()),
	Drug2 = Usables.Drug.new(types.Usable, 34, props()),
	Beer = Usables.Beer.new(types.Usable, 35, props()),
	Chocolate = Usables.Chocolate.new(types.Usable, 36, props()),
	FlaskGreen = Throwables.FlaskGreen.new(types.Usable, 37, props()),
	FlaskRed = Throwables.FlaskRed.new(types.Usable, 38, props()),
	BananaPeel = Throwables.BananaPeel.new(types.Usable, 47, props()),
	CauldronRed = Throwables.CauldronRed.new(types.Usable, 55, props()),
	CauldronGreen = Throwables.CauldronGreen.new(types.Usable, 59, props()),
	CauldronHand = Throwables.CauldronHand.new(types.Usable, 60, props()),
	Molotov = Throwables.Molotov.new(types.Usable, 76, props()),
	Carrot = Usables.Carrot.new(types.Usable, 43, props()),
}
