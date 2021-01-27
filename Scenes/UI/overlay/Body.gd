extends Control

onready var body_parts = {
	head = $Head,
	left_arm = $LArm,
	right_arm = $RArm,
	torso = $Torso,
	left_leg = $LLeg,
	right_leg = $RLeg,
}

var armor = {
	head = Items.armor_type.None,
	left_arm = Items.armor_type.None,
	right_arm = Items.armor_type.None,
	torso = Items.armor_type.None,
	left_leg = Items.armor_type.None,
	right_leg = Items.armor_type.None,
}

func _init():
	var failed = Player.connect("armor_changed", self, "_on_armor_changed")
	assert(!failed, "UI failed to connect to events!")


func _on_armor_changed(armor_type, id):
	armor[armor.keys()[id]] = armor_type
	var part_slot = body_parts[body_parts.keys()[id]]
	part_slot.texture.region = Rect2(armor[armor.keys()[id]]*60, part_slot.texture.region.position.y, 60, 72)
