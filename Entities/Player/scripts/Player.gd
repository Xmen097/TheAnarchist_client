extends Area2D

#player walking speed
export var speed = 100

onready var animation_tree = $AnimationTree
onready var animation_mode = animation_tree["parameters/playback"]
onready var sprite = $Sprite

func _process(delta):
	move(delta)
	look_at_mouse()

func move(delta):
	var velocity = Vector2() # get player velocity
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	if velocity.length() > 0: # if moved
		velocity = velocity.normalized() * speed
		position += velocity * delta
		animation_mode.travel("Walk")
	else: # didn't move
		animation_mode.travel("Idle")

func look_at_mouse(): #change player sprite to look at mouse
	var mouse_pos_blended = Utils.mouse_pos_blended()
	animation_tree.set('parameters/Idle/blend_position', mouse_pos_blended)
	animation_tree.set('parameters/Walk/blend_position', mouse_pos_blended)
	var mouse_angle = Utils.mouse_angle()
	if mouse_angle > 105 or mouse_angle < -105: #some space as to not flicker at border
		sprite.flip_h = true
	elif mouse_angle < 75 and mouse_angle >= 0 or\
		mouse_angle > -75 and mouse_angle <= 0:
		sprite.flip_h = false 
