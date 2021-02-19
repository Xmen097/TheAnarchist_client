extends Area2D


func hit(type, damage): # Will send damage to it's parent
	get_parent().hit(type, damage)

func kick(position, strength): # will apply force to it's parent
	print("kicked")
	get_parent().kicked(position, strength)
