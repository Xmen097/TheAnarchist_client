extends PanelContainer


func _ready():
	visible = false

func _input(event): #Call methods on hands on click event
		if event.is_action_pressed("open_inventory"):
			visible = !visible
