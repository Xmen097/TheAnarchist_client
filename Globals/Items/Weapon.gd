extends Item
class_name Weapon

var weapon
func _init(new_id, new_properties, new_weapon).(6, new_id, new_properties):
	self.weapon = new_weapon
	
func duplicate():
	var dup = get_script().new(self.id, self.properties, self.weapon)
	return dup
