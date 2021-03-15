extends Node

var projectiles_root

func _ready():
	projectiles_root = get_tree().get_root().get_node("Game/ViewportContainer/Viewport/World/ProjectilesContainer")

enum weapons {
	None,
	Cutlass, 
	Halberd, 
	Bow,
}

enum targets {
	Player = 10,
	Enemy = 12,
}

enum types {
	Swing,
	Stab,
	Projectile,
}

enum states {
	Idle,
	Blocking,
	Primary_attacking,
	Preparing,
	Secondary_attacking,
}

class Melee extends Node2D:
	var type = "Melee"
	var data = { # This MUST be changed in child scripts
		idle_animation = "",
		primary_animation = "",
		secondary_animation = "",
		block_animation = "",
		primary_damage = 0,
		secondary_damage = 0,
		primary_range = 0,
		seconary_range = 0,
	}
	var has_idle
	var has_primary
	var has_secondary
	var has_block

	var sprite
	var primary_area
	var primary_collider
	var secondary_area
	var secondary_collider

	var state = states.Idle

	func idle(animation_mode):
		if state != states.Idle:
			state = states.Idle
			if has_idle:
				animation_mode.travel(data.idle_animation)

	func primary_attack(animation_mode):
		if state != states.Idle or not has_primary:
			return
		animation_mode.travel(data.primary_animation)
		state = states.Primary_attacking

	func secondary_attack(animation_mode):
		if state != states.Idle or not has_secondary:
			return
		animation_mode.travel(data.secondary_animation)
		state = states.Secondary_attacking

	func block(animation_mode):
		if state != states.Blocking and has_block:
			state = states.Blocking
			animation_mode.travel(data.block_animation)

	func prepare(_animation_mode):
		if state != states.Preparing:
			state = states.Preparing

	func init(target):
		if has_primary:
			primary_area.set_collision_mask_bit(target, true)
		if has_secondary:
			secondary_area.set_collision_mask_bit(target, true)
			
	func set_active(animation_mode):
		visible = true
		if has_idle:
			animation_mode.start(data.idle_animation)

	func _ready(): # Get all necessary references
		has_idle = true if data.idle_animation != "" else false
		has_primary = true if data.primary_animation != "" else false
		has_secondary = true if data.secondary_animation != "" else false
		has_block = true if data.block_animation != "" else false
		if has_idle:
			sprite = $Sprite
		if has_primary:
			primary_area = $Primary
			primary_collider = $Primary/Collider
		if has_secondary:
			secondary_area = $Secondary
			secondary_collider = $Secondary/Collider

	func primary_damage(): # This is called from animation, will send damage
		var bodies = primary_area.inside()
		for body in bodies:
			body.hit(types.Swing, data.primary_damage)

	func secondary_damage(): # This is called from animation, will send damage
		var bodies = secondary_area.inside()
		for body in bodies:
			body.hit(types.Stab, data.secondary_damage)

	func look_at_mouse(mouse_angle, mirrored): #Weapon will look at mouse
		if mirrored:
			if has_idle:
				sprite.frame_coords.y = round((sign(mouse_angle)*180 - mouse_angle + 100) / 10)
			if has_primary:
				primary_collider.rotation_degrees = mouse_angle - sign(mouse_angle)*180
			if has_secondary:
				secondary_collider.rotation_degrees = mouse_angle - sign(mouse_angle)*180
			pass
		else:
			if has_idle:
				sprite.frame_coords.y = round((mouse_angle + 100) / 10)
			if has_primary:
				primary_collider.rotation_degrees = -mouse_angle
			if has_secondary:
				secondary_collider.rotation_degrees = -mouse_angle


class Ranged extends Node2D:
	var type = "Ranged"
	var state = states.Idle
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
		attacking = false
		
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

	func set_active(animation_mode):
		animation_mode.start(data.idle_animation)
		visible = true
		
	func init(_animation_mode):
		pass # needed for compatibility with meele weapons

	func _ready(): # Get all necessary references
		weapon_sprite = $Weapon
		projectiles_container = Weapons.projectiles_root

	func idle(animation_mode):
		attacking = false
		if click_queued:
			click_queued = false
			prime(animation_mode)

	func look_at_mouse(mouse_angle, mirrored): #Weapon will look at mouse
		if mirrored:
			weapon_sprite.frame_coords.y = round((sign(mouse_angle)*180 - mouse_angle + 100) / 10)
			projectile_sprite.y = round((sign(mouse_angle)*180 - mouse_angle + 100) / 10)
			projectile_sprite.angle = mouse_angle
			projectile_sprite.flip_h = true
		else:
			weapon_sprite.frame_coords.y = round((mouse_angle + 100) / 10)
			projectile_sprite.y = round((mouse_angle + 100) / 10)
			projectile_sprite.angle = mouse_angle
			projectile_sprite.flip_h = false
