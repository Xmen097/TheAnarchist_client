extends Node

var projectiles_root

func _ready():
	projectiles_root = get_tree().get_root().get_node("Game/ViewportContainer/Viewport/ProjectilesContainer")

class Melee extends Node2D:
	var type = "Melee"
	var data = { # This MUST be changed in child scripts
		idle_animation = "",
		primary_animation = "",
		secondary_animation = "",
		primary_damage = 0,
		secondary_damage = 0,
	}

	var sprite
	var primary_area
	var primary_collider
	var secondary_area
	var secondary_collider

	var attacking = false

	func primary_attack(animation_mode):
		if attacking:
			return
		animation_mode.travel(data.primary_animation)
		attacking = true

	func secondary_attack(animation_mode):
		if attacking:
			return
		animation_mode.travel(data.secondary_animation)
		attacking = true

	func init(animation_mode):
		animation_mode.start(data.idle_animation)
		visible = true

	func _ready(): # Get all necessary references
		sprite = $Sprite
		primary_area = $Primary
		primary_collider = $Primary/Collider
		secondary_area = $Secondary
		secondary_collider = $Secondary/Collider

	func idle(animation_mode):
		attacking = false

	func primary_damage(): # This is called from animation, will send damage
		var bodies = primary_area.inside()
		for body in bodies:
			body.damage(data.primary_damage)

	func secondary_damage(): # This is called from animation, will send damage
		var bodies = secondary_area.inside()
		for body in bodies:
			body.damage(data.secondary_damage)

	func look_at_mouse(mouse_angle): #Weapon will look at mouse
		if mouse_angle > 105 or mouse_angle < -105:
			scale = Vector2(-1, 1)
		elif mouse_angle < 75 and mouse_angle >= 0 or\
			mouse_angle > -75 and mouse_angle <= 0:
			scale = Vector2(1, 1)
	
		if scale == Vector2(-1, 1):
			sprite.frame_coords.y = round((sign(mouse_angle)*180 - mouse_angle + 100) / 10)
			primary_collider.rotation_degrees = mouse_angle - sign(mouse_angle)*180
			secondary_collider.rotation_degrees = mouse_angle - sign(mouse_angle)*180
			pass
		else:
			sprite.frame_coords.y = round((mouse_angle + 100) / 10)
			primary_collider.rotation_degrees = -mouse_angle
			secondary_collider.rotation_degrees = -mouse_angle


class Ranged extends Node2D:
	var type = "Ranged"
	export var data = { # This MUST be changed in child scripts
		idle_animation = "",
		prime_animation = "",
		shoot_animation = "",
		primary_damage = 0,
		secondary_damage = 0,
	}

	var weapon_sprite

	var attacking = false
	var click_queued = false

	var projectile_scene
	var projectiles_container
	var projectile_sprite = { # This will be update in look_at_mouse()
		y = 0,
		scale = Vector2(1, 1),
		angle = 0,
	}

	func prime(animation_mode):
		animation_mode.travel(data.prime_animation)
		
	func primary_attack(animation_mode):
		if attacking:
			return
		animation_mode.travel(data.shoot_animation)
		attacking = true
	
	func primary_shoot(): # This is called from animation, will launch projectile
		var projectile = projectile_scene.instance()
		projectile.sprite_data = projectile_sprite
		projectile.damage = data.primary_damage
		projectile.position = global_position
		projectiles_container.add_child(projectile)

	func secondary_attack(animation_mode):
		if attacking:
			return
		animation_mode.travel(data.secondary_animation)
		attacking = true

	func init(animation_mode):
		animation_mode.start(data.idle_animation)
		visible = true

	func _ready(): # Get all necessary references
		weapon_sprite = $Weapon
		projectiles_container = Weapons.projectiles_root

	func idle(animation_mode):
		attacking = false
		look_at_mouse(Utils.mouse_angle())
		print(click_queued)
		if click_queued:
			click_queued = false
			prime(animation_mode)

	func look_at_mouse(mouse_angle): #Weapon will look at mouse
		projectile_sprite.angle = mouse_angle
		if mouse_angle > 105 or mouse_angle < -105:
			scale = Vector2(-1, 1)
			projectile_sprite.flip_h = true
		elif mouse_angle < 75 and mouse_angle >= 0 or\
			mouse_angle > -75 and mouse_angle <= 0:
			scale = Vector2(1, 1)
			projectile_sprite.flip_h = false

		if scale == Vector2(-1, 1):
			weapon_sprite.frame_coords.y = round((sign(mouse_angle)*180 - mouse_angle + 100) / 10)
			projectile_sprite.y = round((sign(mouse_angle)*180 - mouse_angle + 100) / 10)
		else:
			weapon_sprite.frame_coords.y = round((mouse_angle + 100) / 10)
			projectile_sprite.y = round((mouse_angle + 100) / 10)
