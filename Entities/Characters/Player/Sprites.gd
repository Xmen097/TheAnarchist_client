extends Node2D

export var frame = Vector2(0,0) setget change_frame
export var flip_h = false setget change_flip_h

var body_parts = {}

var armor = {
	head = Items.armor_type.None,
	left_arm = Items.armor_type.None,
	right_arm = Items.armor_type.None,
	torso = Items.armor_type.None,
	left_leg = Items.armor_type.None,
	right_leg = Items.armor_type.None,
}

func _ready():
	body_parts = {
		head = $head,
		left_arm = $hand_left,
		right_arm = $hand_right,
		torso = $torso,
		left_leg = $leg_left,
		right_leg = $leg_right,
		left_shoe = $shoe_left,
		right_shoe = $shoe_right,
	}
	var failed = Player.connect("armor_changed", self, "_on_armor_changed")
	assert(!failed, "UI failed to connect to events!")

func change_frame(new_value):
	for id in body_parts:
		body_parts[id].frame_coords = new_value
		
func change_flip_h(new_value):
	for id in body_parts:
		body_parts[id].flip_h = new_value

func _on_armor_changed(part):
	armor[part.id] = part.armor
	var part_slot = body_parts[part.id]
	part_slot.texture = part_slot.texture.duplicate(true)
	part_slot.texture.region = Rect2(armor[part.id]*240, part_slot.texture.region.position.y, 240, 336)
