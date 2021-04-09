class_name Item

var type
var id = -1
var properties = {}
var count
var uuid

func _init(new_type, new_id, new_properties):
	self.type = new_type
	self.id = new_id
	self.properties = new_properties.duplicate()
	self.count = 1
	self.uuid = Uuid.v4()
	if new_properties.stackability == 0: # default stackability
		self.properties.stackability = 2 # single stackability
	
func duplicate():
	var dup = get_script().new(self.type, self.id, self.properties)
	dup.uuid = self.uuid
	return dup
