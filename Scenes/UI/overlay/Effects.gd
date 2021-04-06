extends MarginContainer

var displayer = preload("res://Scenes/UI/Overlay/EffectDisplayer.tscn")
onready var container = $Container

var active = 0
var size = 4
var compression = 28

func _init():
	var success = Effects.connect("effect_added", self, "on_effect_added")
	success = success or Effects.connect("effect_expired", self, "on_effect_expired")
	success = success or Effects.connect("effect_removed", self, "on_effect_removed")
	assert(!success, "Overlay effect displayed failed to connect to events!")

class Effect:
	var sprite_id
	var count = 0
	var reference
	
	func _init(new_sprite_id):
		sprite_id = new_sprite_id


var effects = {
	Effects.effects.Reptail: Effect.new(0),
	Effects.effects.Drunk: Effect.new(1),
	Effects.effects.Slow: Effect.new(2),
	Effects.effects.Speed: Effect.new(3),
	Effects.effects.Nausea: Effect.new(4),
}

func on_effect_added(effect):
	if effects[effect].count == 0:
		active += 1
		effects[effect].reference = displayer.instance()
		effects[effect].reference.texture.region = Rect2(effects[effect].sprite_id * 28, 0, 28, 28)
		container.add_child(effects[effect].reference)
		container.add_constant_override("separation", -max(0, active-size)*compression/ (1 if active <= size else (active-1)))
	effects[effect].count += 1

func on_effect_expired(effect):
	effects[effect].count -= 0
	if effects[effect].count == 0:
		remove_effect(effect)
		
func remove_effect(effect):
	active -= 1
	effects[effect].reference.queue_free()
	effects[effect].count = 0
	container.add_constant_override("separation", -max(0, active-size)*compression)
