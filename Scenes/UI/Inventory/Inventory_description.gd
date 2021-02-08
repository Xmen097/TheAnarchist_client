extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var scroll = $ScrollContainer
onready var label = $ScrollContainer/Label
var time = 0
var text = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(!Player.connect("item_hovered", self, "_on_item_hovered"), "Inventory item description failed to connect to signal")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if text:
		scroll.scroll_horizontal = int(time*20)%(5*(len(text)+3))


func _on_item_hovered(item, id, type):
	text = item.tooltip
	for x in [["š", "s"], ["č", "c"], ["ř", "r"], ["ň", "n"], ["ě", "e"], ["ž", "z"], ["ú", "u"], ["ů", "ú"], ["á", "a"], ["é", "e"], ["í", "i"], ["ý", "y"], ["ó", "o"]]:
		text = text.replace(x[0], x[1])
		text = text.replace(x[0].to_upper(), x[1].to_upper())
	
	label.text = text + "   " + text
