extends Node2D

func mouse_angle():
# How do angles work
#             90 
#  180; -180  <#>  0
#             -90
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


func mouse_pos():
	var x = get_viewport().get_mouse_position().x - get_viewport_rect().size.x/2
	var y = get_viewport().get_mouse_position().y - get_viewport_rect().size.y/2
	return Vector2(x, y)
	
func mouse_pos_blended():
	var x = get_viewport().get_mouse_position().x - get_viewport_rect().size.x/2
	var y = get_viewport().get_mouse_position().y - get_viewport_rect().size.y/2
	var pos = Vector2(x,y).normalized()
	var higher = abs(pos.x) if abs(pos.x) > abs(pos.y) else abs(pos.y)
	var multiplier = 1/higher
	return pos*multiplier
