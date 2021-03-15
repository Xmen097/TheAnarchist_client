extends Area2D

func _on_Falling_area_body_entered(body):
	body.fall()
	
func _on_Falling_area_body_exited(body):
	body.flags.in_fall_area = false
