extends TextureRect

export(Items.types) var accepted_type = Items.types.General
var item setget change_item
export var starting_item_id = 0 
var item_texture
export(bool) var trash = false

func _ready():
	var success = false #connect to events
	success = success or connect("mouse_entered", self, "_on_mouse_entered")
	success = success or connect("mouse_exited", self, "_on_mouse_exited")
	assert(!success, "Inventory frame failed to connect to events!")
	if not trash:
		item_texture = $Item
		change_item(Items.items[Items.items.keys()[starting_item_id]])
	
func _on_mouse_entered():
	self_modulate = Color(1, 1, 1, 255/220.0)

func _on_mouse_exited():
	self_modulate = Color(1, 1, 1, 1)
	
func change_item(new_item): # item setter
	item = new_item;
	if item_texture:
		item_texture.texture.region = Rect2(item.id * 28, 0, 28, 28) # 28 pixels per item
	
	
func get_drag_data(_pos):
	var drag_container = Control.new()
	var drag_preview = item_texture.duplicate()
	drag_preview.rect_scale.x = Utils.scaling_factor
	drag_preview.rect_scale.y = Utils.scaling_factor
	drag_preview.rect_position.x = -28
	drag_preview.rect_position.y = -28
	drag_container.add_child(drag_preview)
	set_drag_preview(drag_container)
	return {item = item, from = self}

func can_drop_data(_pos, data):
	return item == Items.items.None and \
	(data.item.type == accepted_type or accepted_type == Items.types.General) or\
	trash
	
func drop_data(_pos, data):
	change_item(data.item)
	data.from.dropped_success()
	
func dropped_success():
	change_item(Items.items.None)
