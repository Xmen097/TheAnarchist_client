extends Item
class_name Armor

var armor_type
var durability
var max_durability
func _init(new_type, new_id, new_properties, new_armor_type, new_durability).(new_type, new_id, new_properties):
	self.armor_type = new_armor_type
	self.durability = new_durability
	self.max_durability = new_durability
	if not "armor" in self.properties.tooltip:
		self.properties.tooltip += ["armor"] 
	if new_properties.stackability == 0: # default stackability
		self.properties.stackability = 1 # none stackability
	
func duplicate():
	var dup = get_script().new(self.type, self.id, self.properties, self.armor_type, self.durability)
	return dup
