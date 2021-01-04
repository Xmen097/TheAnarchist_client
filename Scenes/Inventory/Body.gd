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



func _on_Head_item_changed(new_item):
	if new_item == Items.items.None:
		armor.head = Items.armor_type.None
	else:
		armor.head = new_item.armor_type
	body_parts.head.texture.region = Rect2(armor.head*60, 360, 60, 72)


func _on_LArm_item_changed(new_item):
	if new_item == Items.items.None:
		armor.left_arm = Items.armor_type.None
	else:
		armor.left_arm = new_item.armor_type
	body_parts.left_arm.texture.region = Rect2(armor.left_arm*60, 288, 60, 72)


func _on_RArm_item_changed(new_item):
	if new_item == Items.items.None:
		armor.right_arm = Items.armor_type.None
	else:
		armor.right_arm = new_item.armor_type
	body_parts.right_arm.texture.region = Rect2(armor.right_arm*60, 216, 60, 72)


func _on_Body_item_changed(new_item):
	if new_item == Items.items.None:
		armor.torso = Items.armor_type.None
	else:
		armor.torso = new_item.armor_type
	body_parts.torso.texture.region = Rect2(armor.torso*60, 0, 60, 72)


func _on_LLeg_item_changed(new_item):
	if new_item == Items.items.None:
		armor.left_leg = Items.armor_type.None
	else:
		armor.left_leg = new_item.armor_type
	body_parts.left_leg.texture.region = Rect2(armor.left_leg*60, 144, 60, 72)


func _on_RLeg_item_changed(new_item):
	if new_item == Items.items.None:
		armor.right_leg = Items.armor_type.None
	else:
		armor.right_leg = new_item.armor_type
	body_parts.right_leg.texture.region = Rect2(armor.right_leg*60, 72, 60, 72)
