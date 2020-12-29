extends Weapons.Melee

func _init():
	data = {
		idle_animation = "Halberd_Idle",
		primary_animation = "Halberd_Stab",
		secondary_animation = "",
		primary_damage = 50,
	}
	has_primary = true
	has_secondary = false
