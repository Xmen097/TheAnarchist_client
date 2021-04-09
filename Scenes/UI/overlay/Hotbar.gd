extends TextureRect

var item = Items.items.None
onready var item_texture = $Item

var stack
var stack_number
export(NodePath) var stack_path

export(int) var hotbar_id = 0

func _init():
	var failed = Player.connect("item_changed", self, "_on_Hotbar_item_changed")
	assert(!failed, "UI failed to connect to events!")
	
func _ready():
	stack = get_node(stack_path) if stack_path != "" else $Stack
	stack_number = stack.get_node("Count")
	
	
func _on_Hotbar_item_changed(new_item, slot_id, type):
	if type == Player.frame_type.Hotbar and slot_id == hotbar_id:
		item = new_item
		item_texture.texture.region = Rect2(item.id * 28, 0, 28, 28) # 28 pixels per item
		
		if item.properties.stackability == Items.stackability.None:
			stack.visible = false
		elif item.properties.stackability == Items.stackability.Single:
			var count = item.count
			stack.visible = true
			stack_number.texture.region = Rect2(count * 9, 0, 9, 8)
			stack.texture.region = Rect2(0, 0, 13, 22)
		elif item.properties.stackability == Items.stackability.Multi:
			var stack_count = (item.count-1) / 12
			var count = (item.count-1) % 12 +1
			stack.visible = true
			stack_number.texture.region = Rect2(count * 9, 0, 9, 8)
			stack.texture.region = Rect2(13 + stack_count * 13, 0, 13, 22)
