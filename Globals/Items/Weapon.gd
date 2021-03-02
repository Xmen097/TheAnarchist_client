extends Item
class_name Weapon

var weapon
func _init(new_type, new_id, new_tooltip, new_description, new_weapon).(new_type, new_id, new_tooltip, new_description):
	self.weapon = new_weapon
	
func duplicate():
	var dup = get_script().new(self.type, self.id, self.tooltip, self.description, self.weapon)
	return dup
