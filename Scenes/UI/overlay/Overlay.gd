extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true

func _input(event): #Call methods on hands on click event
		if event.is_action_pressed("open_inventory"):
			visible = !visible
