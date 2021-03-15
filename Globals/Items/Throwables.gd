class_name Throwables

class Throwable extends Item:
	var throwable_id
	var rotspeed = -10 # multiple of 100 deg/sec
	var offset = Vector2(0, 6)
	
	func _init(new_type, new_id, new_tooltip).(new_type, new_id, new_tooltip):
		pass
	func use():
		var throw = Items.throwable_instance.instance()
		throw.id = throwable_id
		throw.item = self
		throw.rotspeed = rotspeed
		throw.position = Player.get_reference().global_position - offset
		throw.end_position = Player.get_reference().camera.global_position+Utils.mouse_pos()/Utils.scaling_factor
		throw.velocity = throw.position.direction_to(throw.end_position)
		Weapons.projectiles_root.add_child(throw)
		
	func dropped():
		print("DROPPED!")
		
	func hit(body):
		return false # return whether flying item should stop

class Stone extends Throwable:
	func _init(new_type, new_id, new_tooltip).(new_type, new_id, new_tooltip):
		throwable_id = 1
		
	func hit(body):
		body.hit(Weapons.types.Projectile, 10)
		return true
		
class FlaskGreen extends Throwable:
	func _init(new_type, new_id, new_tooltip).(new_type, new_id, new_tooltip):
		throwable_id = 2
		
class FlaskRed extends Throwable:
	func _init(new_type, new_id, new_tooltip).(new_type, new_id, new_tooltip):
		throwable_id = 3
		
class BananaPeel extends Throwable:
	func _init(new_type, new_id, new_tooltip).(new_type, new_id, new_tooltip):
		throwable_id = 8
		
class CauldronRed extends Throwable:
	func _init(new_type, new_id, new_tooltip).(new_type, new_id, new_tooltip):
		throwable_id = 9
		
class CauldronGreen extends Throwable:
	func _init(new_type, new_id, new_tooltip).(new_type, new_id, new_tooltip):
		throwable_id = 13
		
class CauldronHand extends Throwable:
	func _init(new_type, new_id, new_tooltip).(new_type, new_id, new_tooltip):
		throwable_id = 14
		
class Molotov extends Throwable:
	func _init(new_type, new_id, new_tooltip).(new_type, new_id, new_tooltip):
		throwable_id = 15
