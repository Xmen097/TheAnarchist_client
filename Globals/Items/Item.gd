class_name Item

var type
var id = -1
var tooltip = ""
var description = ""

func _init(new_type, new_id, new_tooltip, new_description):
	self.type = new_type
	self.id = new_id
	self.tooltip = new_tooltip
	self.description = new_description
	
func duplicate():
	var dup = get_script().new(self.type, self.id, self.tooltip, self.description)
	return dup
