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

enum armor {
	None,
	Steel,
}
var body_armor = {
	head = armor.None,
	left_arm = armor.None,
	right_arm = armor.None,
	torso = armor.None,
	left_leg = armor.None,
	right_leg = armor.None,
}

