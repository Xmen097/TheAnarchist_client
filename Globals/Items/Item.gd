class_name Item

var type
var id = -1
var tooltip = []
var cost

func _init(new_type, new_id, new_tooltip, new_cost):
	self.type = new_type
	self.id = new_id
	self.tooltip = new_tooltip
	self.cost = new_cost
	
func duplicate():
	var dup = get_script().new(self.type, self.id, self.tooltip, self.cost)
	return dup
