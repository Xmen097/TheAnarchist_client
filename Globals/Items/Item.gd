class_name Item

var type
var id = -1
var tooltip = []

func _init(new_type, new_id, new_tooltip):
	self.type = new_type
	self.id = new_id
	self.tooltip = new_tooltip
	
func duplicate():
	var dup = get_script().new(self.type, self.id, self.tooltip)
	return dup
