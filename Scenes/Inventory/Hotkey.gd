extends TextureRect

onready var key_display = $Key
export var position = -1

func _ready():
	var key = InputMap.get_action_list("hotbar_"+str(position))[0].as_text()
	var key_position = Utils.get_character_id(key)
	key_display.texture.region = Rect2(key_position * 5, 0, 5, 9)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
