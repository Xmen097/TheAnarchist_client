extends MarginContainer


func _input(event): #  Call methods on hands on click event
		if event.is_action_pressed("hotbar_0"):
			use(0)
		if event.is_action_pressed("hotbar_1"):
			use(1)
		if event.is_action_pressed("hotbar_2"):
			use(2)
		if event.is_action_pressed("hotbar_3"):
			use(3)
		if event.is_action_pressed("hotbar_4"):
			use(4)
		if event.is_action_pressed("hotbar_5"):
			use(5)
		if event.is_action_pressed("hotbar_6"):
			use(6)
			
func use(id):
	if Player.items.hotbar[id] != Items.items.None:
		Player.items.hotbar[id].use()
		#Player._on_item_changed(Items.items.None, id, Player.frame_type.Hotbar)
