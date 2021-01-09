extends TextureRect

var item = Items.items.None
onready var item_texture = $Item

export(int) var hotbar_id = 0

func _init():
	var failed = Player.connect("item_changed", self, "_on_Hotbar_item_changed")
	assert(!failed, "UI failed to connect to events!")
	
	
func _on_Hotbar_item_changed(new_item, slot_id, type):
	if type == Player.frame_type.Hotbar and slot_id == hotbar_id:
		item = new_item
		item_texture.texture.region = Rect2(item.id * 28, 0, 28, 28) # 28 pixels per item
