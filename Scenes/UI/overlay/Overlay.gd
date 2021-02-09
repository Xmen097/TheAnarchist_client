extends PanelContainer


func _input(event): #Call methods on hands on click event
	if not visible and event.is_action_pressed("ui_cancel"):
		visible = true
	if event.is_action_pressed("open_inventory"):
		visible = !visible

func _ready():
	visible = true
