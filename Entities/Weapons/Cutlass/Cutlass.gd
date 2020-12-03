#Cutlass weapons - customized from Weapons.gd template
extends Weapons.Melee

func _init():
	data = {
		idle_animation = "Cutlass_Idle",
		primary_animation = "Cutlass_Swing",
		secondary_animation = "Cutlass_Stab",
		primary_damage = 35,
		secondary_damage = 25,
	}
