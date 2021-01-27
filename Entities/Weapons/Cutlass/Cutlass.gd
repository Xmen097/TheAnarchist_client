#Cutlass weapons - customized from Weapons.gd template
extends Weapons.Melee

func _init():
	data = {
		idle_animation = "Cutlass_Idle",
		block_animation = "Cutlass_Block",
		primary_animation = "Cutlass_Swing",
		secondary_animation = "Cutlass_Stab",
		primary_damage = 35,
		secondary_damage = 25,
		primary_range = 30,
		secondary_range = 35,
	}
	has_primary = true
	has_secondary = true
	has_block = true
