# Inventory frame.
# When an Item is changed, this will only send a signal to Player global object
# Then, it will receive from Player _on_item_changed


extends TextureRect

export(Items.types) var accepted_type = Items.types.General
var item = Items.items.None setget change_item
export var starting_item_id = 0 
var item_texture
var preview
export(bool) var is_trash = false
export(bool) var has_preview = false

export(int) var frame_id
export(Player.frame_type) var frame_type

export(int) var cost = 0

signal item_changed(new_item, id, type)


func _ready():
	var success = false #connect to events
	success = success or connect("mouse_entered", self, "_on_mouse_entered")
	success = success or connect("mouse_exited", self, "_on_mouse_exited")
	success = success or connect("item_changed", Player, "_on_item_changed")
	success = success or Player.connect("item_changed", self, "_on_item_changed")
	assert(!success, "Inventory frame failed to connect to events!")
	if not is_trash:
		item_texture = $Item
		if starting_item_id != 0:
			emit_signal("item_changed", Items.items[Items.items.keys()[starting_item_id]].duplicate(), frame_id, frame_type)
	if has_preview:
		preview = $Preview
	
func _on_mouse_entered():
	self_modulate = Color(1, 1, 1, 255/220.0)
	Player.emit_signal("item_hovered", Items.items[Items.items.keys()[starting_item_id]], frame_id, frame_type)

func _on_mouse_exited():
	self_modulate = Color(1, 1, 1, 1)
	
func change_item(new_item): # item setter
	item = new_item
	if has_preview:
		preview.visible = item == Items.items.None
	if item_texture:
		item_texture.texture.region = Rect2(item.id * 28, 0, 28, 28) # 28 pixels per item
	
	
func get_drag_data(_pos):
	if item == Items.items.None:
		return
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
	if frame_type == Player.frame_type.Shop:
		return false
	
	var shop_ok = data.from.frame_type != Player.frame_type.Shop or (data.from.item.cost < GameManager.get_stat(GameManager.stat.player.gold) and not is_trash)
	
	return shop_ok and item == Items.items.None and \
	(data.item.type == accepted_type or accepted_type == Items.types.General) and \
	not (frame_type == Player.frame_type.Body and Player.body[Player.body.keys()[frame_id]].armor == Items.armor_type.Destroyed) or\
	is_trash
	
func drop_data(_pos, data):
	emit_signal("item_changed", data.item, frame_id, frame_type)
	if data.from.frame_type == Player.frame_type.Shop:
		GameManager.increase_stat(GameManager.stat.player.gold, -data.from.item.cost)
	data.from.dropped_success()
	
func dropped_success():
	if frame_type != Player.frame_type.Shop:
		emit_signal("item_changed", Items.items.None, frame_id, frame_type)

func _on_item_changed(new_item, id, type):
	if frame_type == type and id == frame_id:
		change_item(new_item)
