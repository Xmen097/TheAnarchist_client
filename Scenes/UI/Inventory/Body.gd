extends Control

onready var body_boxes = {
	head = $Boxes/Head,
	amulet = $Boxes/Amulet,
	left_arm = $Boxes/LArm,
	right_arm = $Boxes/RArm,
	body = $Boxes/Body,
	left_left = $Boxes/LLeg,
	right_leg = $Boxes/RLeg,
	shoes = $Boxes/Shoes,
	left_weapon = $Boxes/LWeapon,
	right_weapon = $Boxes/RWeapon,
}
onready var boxes = $Boxes

onready var body_parts = {
	head = $BodyParts/Head,
	left_arm = $BodyParts/LArm,
	right_arm = $BodyParts/RArm,
	torso = $BodyParts/Torso,
	left_leg = $BodyParts/LLeg,
	right_leg = $BodyParts/RLeg,
}
onready var body = $BodyParts

var armor = {
	head = Items.armor_type.None,
	left_arm = Items.armor_type.None,
	right_arm = Items.armor_type.None,
	torso = Items.armor_type.None,
	left_leg = Items.armor_type.None,
	right_leg = Items.armor_type.None,
}

func _on_Body_item_changed(new_item, id, _type):
	if new_item == Items.items.None:
		armor[armor.keys()[id]] = Items.armor_type.None
	else:
		armor[armor.keys()[id]] = new_item.armor_type
	var part_slot = body_parts[body_parts.keys()[id]]
	part_slot.texture.region = Rect2(armor[armor.keys()[id]]*60, part_slot.texture.region.position.y, 60, 72)
