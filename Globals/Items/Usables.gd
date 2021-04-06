class_name Usables

class Usable extends Item:
	var use_animation = ""
	
	func _init(new_id, new_properties).(8, new_id, new_properties):
		pass
	func use():
		Player.get_reference().use(use_animation)
		
	func duplicate():
		var dup = get_script().new(self.id, self.properties)
		return dup

class Medkit extends Usable:
	func _init(new_id, new_properties).(new_id, new_properties):
		use_animation = "eat_twohand"
	func use():
		.use()
		for i in Player.body:
			if Player.body[i].health != Player.body[i].max_health:
				Player.body[i].health = Player.body[i].max_health
				Player.on_body_damaged(Player.body[i])

class Drug extends Usable:
	func _init(new_id, new_properties).(new_id, new_properties):
		use_animation = "drug"
	func use():
		.use()
		Player.get_reference().effect_speed_multiplier = 1.5
		Effects.add_effect(Effects.effects.Speed)

class Cyanite extends Usable:
	func _init(new_id, new_properties).(new_id, new_properties):
		use_animation = "eat_onehand"
	func use():
		.use()
		Player.get_reference().die()
		
class Reptail extends Usable: # Reptilian tail, replaces cut-out externality
	func _init(new_id, new_properties).(new_id, new_properties):
		use_animation = "eat_twohand"
	func use():
		.use()
		Effects.add_effect(Effects.effects.Reptail)
		
class Beer extends Usable:
	func _init(new_id, new_properties).(new_id, new_properties):
		use_animation = "drug"
	func use():
		.use()
		Effects.add_effect(Effects.effects.Drunk)
		
class Chocolate extends Usable:
	func _init(new_id, new_properties).(new_id, new_properties):
		use_animation = "eat_twohand"
	func use():
		.use()
		for effect in Effects.effects:
			Effects.remove_effect(effect)
		Effects.add_effect(Effects.effects.Slow)

class Carrot extends Usable:
	func _init(new_id, new_properties).(new_id, new_properties):
		use_animation = "eat_onehand"
	func use():
		.use()
