extends Item
class_name Backpack

var grade
func _init(new_id, new_properties, new_grade).(9, new_id, new_properties):
	self.grade = new_grade
	if new_properties.stackability == 0: # default stackability
		self.properties.stackability = 1 # none stackability
	
func duplicate():
	var dup = get_script().new(self.id, self.properties, self.grade)
	dup.uuid = self.uuid
	return dup
