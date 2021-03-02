class_name Usables

class Usable extends Item:
	func _init(new_type, new_id, new_tooltip, new_description).(new_type, new_id, new_tooltip, new_description):
		pass
	func use():
		pass

class Medkit extends Usable:
	func _init(new_type, new_id, new_tooltip, new_description).(new_type, new_id, new_tooltip, new_description):
		pass
	func use():
		for i in Player.body:
			if Player.body[i].health != Player.body[i].max_health:
				Player.body[i].health = Player.body[i].max_health
				Player.on_body_damaged(Player.body[i])

class Drug extends Usable:
	func _init(new_type, new_id, new_tooltip, new_description).(new_type, new_id, new_tooltip, new_description):
		pass
	func use():
		Player.get_reference().effect_speed_multiplier = 1.5

class Cyanite extends Usable:
	func _init(new_type, new_id, new_tooltip, new_description).(new_type, new_id, new_tooltip, new_description):
		pass
	func use():
		Player.get_reference().die()
