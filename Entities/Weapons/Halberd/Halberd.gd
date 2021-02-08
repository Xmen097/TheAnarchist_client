extends Weapons.Melee

func _init():
	data = {
		idle_animation = "Halberd_Idle",
		primary_animation = "",
		secondary_animation = "Halberd_Stab",
		secondary_damage = 50,
	}
	has_primary = false
	has_secondary = true
