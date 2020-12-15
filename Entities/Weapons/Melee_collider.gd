extends Area2D

#will register all objects inside collider
var inside_click_range = []

func _ready():
	var success = false #connect to events
	success = success or connect("body_entered", self, "_on_body_entered")
	success = success or connect("body_exited", self, "_on_body_exited")
	assert(!success, "Collider detector failed to connect!")

func _on_body_entered(body):
	inside_click_range.append(body)

func _on_body_exited(body):
	inside_click_range.remove(inside_click_range.bsearch(body))

func inside():
	return inside_click_range
