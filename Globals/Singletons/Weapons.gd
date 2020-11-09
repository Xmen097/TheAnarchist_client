extends Node

class Melee extends Node2D:
	var data = {
		idle_animation = "",
		left_click_animation = "",
		right_click_animation = "",
		damage = 0,
	}
	
	var sprite
	var left_click_area
	var left_click_collider
	var left_click_start_timer
	
	var attacking = false
		
	func left_click(animation_mode):
		if !attacking:
			left_click_start_timer.start()
			animation_mode.travel(data.left_click_animation)
			attacking = true

	func right_click(animation_mode):
		if !attacking:
			animation_mode.travel(data.right_click_animation)
			attacking = true

	func init(animation_mode):
		animation_mode.start(data.idle_animation)

	func _ready():
		sprite = $Sprite
		left_click_area = $Left_click
		left_click_start_timer = $Left_click/Start_timer
		left_click_collider = $Left_click/Collider
		left_click_start_timer.connect("timeout", self, "attack", [left_click_area.inside()])

	func idle():
		attacking = false

	func attack(bodies):
		for body in bodies:
			body.damage(data.damage)
			
	func look_at_mouse(mouse_angle):
		if mouse_angle > 105 or mouse_angle < -105:
			scale = Vector2(-1, 1)
		elif mouse_angle < 75 and mouse_angle >= 0 or\
			mouse_angle > -75 and mouse_angle <= 0:
			scale = Vector2(1, 1)
	
		if scale == Vector2(-1, 1):
			sprite.frame_coords.y = round((sign(mouse_angle)*180 - mouse_angle + 100) / 10)
			left_click_collider.rotation_degrees = mouse_angle - sign(mouse_angle)*180
			pass
		else:
			sprite.frame_coords.y = round((mouse_angle + 100) / 10)
			left_click_collider.rotation_degrees = -mouse_angle


