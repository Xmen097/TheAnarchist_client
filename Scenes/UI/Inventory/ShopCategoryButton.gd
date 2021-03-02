extends TextureButton


export (PackedScene)var shop_scene
onready var inventory = $"../../../Middle/Middle/Inventory/Inventory"
var shop_tab


func _ready():
	shop_tab = shop_scene.instance()
	assert(!connect("pressed", self, "_on_pressed"), "Shop category button failed to connect to events!")


func _on_pressed():
	var node = inventory.get_node("Shop")
	
	shop_tab.visible = true
	var pos_in_parent = node.get_position_in_parent()
	
	inventory.remove_child(node)
	inventory.add_child(shop_tab)
	inventory.move_child(shop_tab, pos_in_parent)
