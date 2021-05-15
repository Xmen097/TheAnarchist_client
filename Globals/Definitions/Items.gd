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
	Backpack = 9,
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
enum stackability {
	Default, # stackability set by item constructor
	None,
	Single,
	Multi,
}

func props(cost=0, tooltip=null, item_stackability=stackability.Default):
	if tooltip == null:
		tooltip = []
	return {cost = cost, tooltip = tooltip, stackability = item_stackability}





# Usable constructor(sprite_id, props) ! requires separate item implementation.
# Throwable constructor(sprite_id, props) ! requires separate item implementation.
# Weapon constructor(sprite_id, props, weapon)
# Item constructor(type, sprite_id, props)
# Armor constructor(type, sprite_id, props, armor_type, durability)
# Backpack constructor(type, sprite_id, props, grade)

# item_id = line_number - 50
var items = { # This should be on line 49
	None = Item.new(types.General, 0, props(0, null, stackability.None)),
	Obsidian_leggins = Armor.new(types.Leg_armor, 1, props(10), armor_type.Obsidian, 300),
	Obsidian_chestplate = Armor.new(types.Torso_armor, 2, props(10), armor_type.Obsidian, 300),
	Obsidian_armplate = Armor.new(types.Arm_armor, 3, props(10), armor_type.Obsidian, 300),
	Obsidian_helmet = Armor.new(types.Head_armor, 4, props(10), armor_type.Obsidian, 300),
	Diamond_leggins = Armor.new(types.Leg_armor, 5, props(10), armor_type.Diamond, 250),
	Diamond_chestplate = Armor.new(types.Torso_armor, 6, props(10), armor_type.Diamond, 250),
	Diamond_armplate = Armor.new(types.Arm_armor, 7, props(10), armor_type.Diamond, 250),
	Diamond_helmet = Armor.new(types.Head_armor, 8, props(10), armor_type.Diamond, 250),
	Golden_leggins = Armor.new(types.Leg_armor, 9, props(10), armor_type.Golden, 200),
	Golden_chestplate = Armor.new(types.Torso_armor, 10, props(10), armor_type.Golden, 200),
	Golden_armplate = Armor.new(types.Arm_armor, 11, props(10), armor_type.Golden, 200),
	Golden_helmet = Armor.new(types.Head_armor, 12, props(10), armor_type.Golden, 200),
	Steel_leggins = Armor.new(types.Leg_armor, 13, props(10), armor_type.Steel, 150),
	Steel_chestplate = Armor.new(types.Torso_armor, 14, props(10), armor_type.Steel, 150),
	Steel_armplate = Armor.new(types.Arm_armor, 15, props(10), armor_type.Steel, 150),
	Steel_helmet = Armor.new(types.Head_armor, 16, props(10), armor_type.Steel, 150),
	Makeshift_leggins = Armor.new(types.Leg_armor, 17, props(10), armor_type.Makeshift, 50),
	Makeshift_chestplate = Armor.new(types.Torso_armor, 18, props(10), armor_type.Makeshift, 50),
	Makeshift_armplate = Armor.new(types.Arm_armor, 19, props(10), armor_type.Makeshift, 50),
	Makeshift_helmet = Armor.new(types.Head_armor, 20, props(10), armor_type.Makeshift, 50),
	Moss_leggins = Armor.new(types.Leg_armor, 21, props(10), armor_type.Moss, 100),
	Moss_chestplate = Armor.new(types.Torso_armor, 22, props(10), armor_type.Moss, 100),
	Moss_armplate = Armor.new(types.Arm_armor, 23, props(10), armor_type.Moss, 100),
	Moss_helmet = Armor.new(types.Head_armor, 24, props(10), armor_type.Moss, 100),
	Leather_shoes = Item.new(types.Shoes, 25, props(10)),
	Cutlass = Weapon.new(26, props(10), Weapons.weapons.Cutlass),
	Bow = Weapon.new(78, props(10), Weapons.weapons.Bow),
	Halberd = Weapon.new(79, props(10), Weapons.weapons.Halberd),
	Necklace = Item.new(types.Amulet, 27, props(10)),
	Medkit = Usables.Medkit.new(28, props(10)),
	Drug = Usables.Drug.new(45, props(10)),
	Stone = Throwables.Stone.new(31, props(10, [], stackability.Multi)),
	Cyanite = Usables.Cyanite.new(44, props(10)),
	Reptail = Usables.Reptail.new(33, props(10)),
	Drug2 = Usables.Drug.new(34, props(10)),
	Beer = Usables.Beer.new(35, props(10, [], stackability.Multi)),
	Chocolate = Usables.Chocolate.new(36, props(10)),
	FlaskGreen = Throwables.FlaskGreen.new(37, props(10)),
	FlaskRed = Throwables.FlaskRed.new(38, props(10)),
	BananaPeel = Throwables.BananaPeel.new(47, props(10)),
	CauldronRed = Throwables.CauldronRed.new(55, props(10)),
	CauldronGreen = Throwables.CauldronGreen.new(59, props(10)),
	CauldronHand = Throwables.CauldronHand.new(60, props(10)),
	Molotov = Throwables.Molotov.new(76, props(10)),
	Carrot = Usables.Carrot.new(43, props(10, [])),
	BackpackSmall = Backpack.new(71, props(10, []), 1),
	BackpackMedium = Backpack.new(69, props(10, []), 2),
	BackpackLarge = Backpack.new(67, props(10, []), 3)
}
