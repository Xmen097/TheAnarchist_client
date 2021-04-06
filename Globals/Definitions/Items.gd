extends Node

enum types {
	General = 0,
	Head_armor = 1,
	Arm_armor = 2,
	Torso_armor = 3,
	Leg_armor = 4,
	Shoes = 5,
	Weapon = 6,
	Amulet = 7,
	Usable = 8,
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




# Usable constructor(sprite_id, props) ! requires separate item implementation.
# Throwable constructor(sprite_id, props) ! requires separate item implementation.
# Weapon constructor(sprite_id, props, weapon)
# Item constructor(type, sprite_id, props)
# Armor constructor(type, sprite_id, props, armor_type, durability)

# item_id = line_number - 40
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
	Cutlass = Weapon.new(26, props(), Weapons.weapons.Cutlass),
	Bow = Weapon.new(78, props(), Weapons.weapons.Bow),
	Halberd = Weapon.new(79, props(), Weapons.weapons.Halberd),
	Necklace = Item.new(types.Amulet, 27, props()),
	Medkit = Usables.Medkit.new(28, props()),
	Drug = Usables.Drug.new(45, props()),
	Stone = Throwables.Stone.new(31, props()),
	Cyanite = Usables.Cyanite.new(44, props()),
	Reptail = Usables.Reptail.new(33, props()),
	Drug2 = Usables.Drug.new(34, props()),
	Beer = Usables.Beer.new(35, props()),
	Chocolate = Usables.Chocolate.new(36, props()),
	FlaskGreen = Throwables.FlaskGreen.new(37, props()),
	FlaskRed = Throwables.FlaskRed.new(38, props()),
	BananaPeel = Throwables.BananaPeel.new(47, props()),
	CauldronRed = Throwables.CauldronRed.new(55, props()),
	CauldronGreen = Throwables.CauldronGreen.new(59, props()),
	CauldronHand = Throwables.CauldronHand.new(60, props()),
	Molotov = Throwables.Molotov.new(76, props()),
	Carrot = Usables.Carrot.new(43, props()),
}
