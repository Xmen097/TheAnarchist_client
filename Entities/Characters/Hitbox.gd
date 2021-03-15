extends Area2D


func hit(type, damage): # Will send damage to it's parent
	get_parent().hit(type, damage)

func kick(position, strength): # will apply force to it's parent
	print("kicked")
	get_parent().kicked(position, strength)
	

func _on_body_entered(body):
	if body.is_in_group("Projectile"):
		body.direction = Vector2(0,0) #Stop projectile movement
		hit(Weapons.types.Projectile, body.damage)
	elif body.is_in_group("Throwable"):
		var stop = body.item.hit(self)
		if stop:
			body.stop()
