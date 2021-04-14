extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Array) var items = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body == Player.player_ref:
		Player.stats.near_chest = self


func _on_Area2D_body_exited(body):
	if body == Player.player_ref:
		Player.stats.near_chest = null
