extends TextureButton


export (PackedScene)var shop_scene
onready var inventory = $"../../../Middle/Middle/Inventory/Inventory"


func _ready():
	assert(!connect("pressed", self, "_on_pressed"), "Shop category button failed to connect to events!")


func _on_pressed():
	print("pressed")
	
	if inventory.get_node("Shop"):
		inventory.get_node("Shop").queue_free()
	inventory.add_child(shop_scene.instance())
