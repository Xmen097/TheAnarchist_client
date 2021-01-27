extends Area2D


func hit(type, damage): # Will send damage to it's parent
	get_parent().hit(type, damage)
