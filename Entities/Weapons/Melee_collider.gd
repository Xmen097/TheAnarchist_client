extends Area2D

#will register all objects inside collider
var inside_click_range = []
export var target = "Enemy"

func _ready():
	var success = false #connect to events
	success = success or connect("area_entered", self, "_on_area_entered")
	success = success or connect("area_exited", self, "_on_area_exited")
	assert(!success, "Collider detector failed to connect!")

func _on_area_entered(area):
	if area.is_in_group(target):
		inside_click_range.append(area)

func _on_area_exited(area):
	if area.is_in_group(target):
		inside_click_range.remove(inside_click_range.bsearch(area))

func inside():
	return inside_click_range
