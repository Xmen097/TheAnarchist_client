extends Item
class_name Weapon

var weapon
func _init(new_id, new_properties, new_weapon).(6, new_id, new_properties):
	self.weapon = new_weapon
	if new_properties.stackability == 0: # default stackability
		self.properties.stackability = 1 # none stackability
	
func duplicate():
	var dup = get_script().new(self.id, self.properties, self.weapon)
	return dup
