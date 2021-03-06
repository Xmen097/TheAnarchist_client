extends Item
class_name Armor

var armor_type
var durability
var max_durability
func _init(new_type, new_id, new_tooltip, new_armor_type, new_durability).(new_type, new_id, new_tooltip):
	self.armor_type = new_armor_type
	self.durability = new_durability
	self.max_durability = new_durability
	
func duplicate():
	var dup = get_script().new(self.type, self.id, self.tooltip, self.armor_type, self.durability)
	return dup
