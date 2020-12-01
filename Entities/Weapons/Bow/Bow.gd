extends Weapons.Ranged


func _init():
	data = {
		idle_animation = "Bow_Idle",
		prime_animation = "Bow_Prime",
		shoot_animation = "Bow_Shoot",
		primary_damage = 33,
	}
	projectile_scene = preload("res://Entities/Weapons/Bow/Projectile.tscn")
