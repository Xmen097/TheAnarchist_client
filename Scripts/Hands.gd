extends Node2D

onready var animation_tree = get_node("AnimationTree")
onready var animation_mode = animation_tree["parameters/playback"]

var active_weapon: Node

func _mouse_angle():
	var x = get_viewport().get_mouse_position().x - get_viewport_rect().size.x/2
	var y = get_viewport().get_mouse_position().y - get_viewport_rect().size.y/2
	var angle
	if x != 0:
		angle = abs(atan(y/x))
	else:
		angle = PI/2
	if x < 0:
		angle = PI - angle
	angle = angle * (1 if y < 0 else -1)
	return angle/PI*180

func look_at_mouse():
	var angle = _mouse_angle()
	if active_weapon.flip_h:
		active_weapon.frame_coords.y = round((sign(angle)*180 - angle + 100) / 10)
	else:
		active_weapon.frame_coords.y = round((angle + 100) / 10)
	if angle > 105 or angle < -105:
		active_weapon.flip_h = true
	elif angle < 75 and angle >= 0 or angle > -75 and angle <= 0:
		active_weapon.flip_h = false

func _input(event):
	if event.is_action_pressed("attack"):
		active_weapon.left_click(animation_mode)

func _ready():
	active_weapon = $Weapons/Cutlass
	active_weapon.idle(animation_mode)

func _process(delta):
	look_at_mouse()
	
class_name Weapon

class Melee extends Sprite:
	var data = {
		idle_animation = "",
		left_click_animation = "",
		right_click_animation = "",
		damage = 0,
		timeout = 0
	}
		
	func left_click(animation_mode):
		animation_mode.travel(data.left_click_animation)
		print(data.left_click_animation)

	func right_click(animation_mode):
		animation_mode.travel(data.right_click_animation)

	func idle(animation_mode):
		animation_mode.start(data.idle_animation)

