extends Node2D

var player_ref
var scaling_factor = 0

func mouse_angle():
# How do angles work
#             90 
#  180; -180  <#>  0
#             -90
	var x = get_viewport().get_mouse_position().x - get_viewport_rect().size.x/2
	var y = get_viewport().get_mouse_position().y - get_viewport_rect().size.y/2
	return vec_to_angle(Vector2(x,y))

func vec_to_angle(vec):
	var y = vec.y
	var x = vec.x
	var angle
	if x != 0:
		angle = abs(atan(y/x))
	else:
		angle = PI/2
	if x < 0:
		angle = PI - angle
	angle = angle * (1 if y < 0 else -1)
	return angle/PI*180

func angle_to_vec(angle):
	angle = (angle/180)*PI
	var y = sin(angle)
	var x = cos(angle)
	return Vector2(x,y)

func mouse_pos():
	var x = get_viewport().get_mouse_position().x - get_viewport_rect().size.x/2
	var y = get_viewport().get_mouse_position().y - get_viewport_rect().size.y/2
	return Vector2(x, y)

func mouse_pos_blended():
	var x = get_viewport().get_mouse_position().x - get_viewport_rect().size.x/2
	var y = get_viewport().get_mouse_position().y - get_viewport_rect().size.y/2
	var pos = Vector2(x,y).normalized()
	var higher = abs(pos.x) if abs(pos.x) > abs(pos.y) else abs(pos.y)
	var multiplier
	if higher != 0:
		multiplier = 1/higher
	else:
		multiplier = 0
	return pos*multiplier
	
func vec_to_pos_blended(vec):
	var pos = vec.normalized()
	var higher = abs(pos.x) if abs(pos.x) > abs(pos.y) else abs(pos.y)
	var multiplier = 1/higher
	return pos*multiplier


var characters = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
'1','2','3','4','5','6','7','8','9','0', ',', '.', ' ', ':']

func get_character_id(character):
	 return characters.find(character, 0)
