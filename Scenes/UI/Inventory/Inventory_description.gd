extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var label = $RichTextLabel
export var maxlen = 8
var text = ""
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(!Player.connect("item_hovered", self, "_on_item_hovered"), "Inventory item description failed to connect to signal")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	# TODO: marquee


func _on_item_hovered(item, id, type):
	text = item.tooltip
	label.bbcode_text = "[shake rate=10 level=5]" + text + "[/shake]"
