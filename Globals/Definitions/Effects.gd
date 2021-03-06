extends Node

signal effect_added(effect)
signal effect_expired(effect)
signal effect_removed(effect)

enum effects {
	Reptail,
	Drunk,
	Slow,
	Speed,
	Nausea
}

func add_effect(effect):
	emit_signal("effect_added", effect)
	
func remove_effect(effect):
	emit_signal("effect_removed", effect)
	
func expire_effect(effect):
	emit_signal("effect_expired", effect)
