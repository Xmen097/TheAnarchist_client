extends Node2D

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
	if $Right/Weapon.flip_h:
		$Right/Weapon.frame_coords.x = round((sign(angle)*180 - angle + 100) / 10)
	else:
		$Right/Weapon.frame_coords.x = round((angle + 100) / 10)
	if angle > 105 or angle < -105:
		$Right/Weapon.flip_h = true
	elif angle < 75 and angle >= 0 or angle > -75 and angle <= 0:
		$Right/Weapon.flip_h = false


func _ready():
	$AnimationPlayer.current_animation = "Idle"
	
func _process(delta):
	look_at_mouse()
