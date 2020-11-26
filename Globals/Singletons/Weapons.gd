extends Node

class Melee extends Node2D:
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
		if !attacking:
			animation_mode.travel(data.primary_animation)
			attacking = true

	func secondary_attack(animation_mode):
		if !attacking:
			animation_mode.travel(data.secondary_animation)
			attacking = true

	func init(animation_mode):
		animation_mode.start(data.idle_animation)
		visible = true

	func _ready(): # Get all necessary references
		sprite = $Sprite
		primary_area = $Primary
		primary_collider = $Primary/Collider
		secondary_area = $Primary
		secondary_collider = $Primary/Collider

	func idle():
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
			pass
		else:
			sprite.frame_coords.y = round((mouse_angle + 100) / 10)
			primary_collider.rotation_degrees = -mouse_angle


