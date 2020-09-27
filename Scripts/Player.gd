extends Area2D

export var speed = 100

func _process(delta):
	look_at_mouse()
	move(delta)

func _ready():
	$AnimationPlayer.current_animation = "Idle_D"

func look_at_mouse():
	var mouse_pos = get_viewport().get_mouse_position().x - get_viewport_rect().size.x/2 # mouse x position relative to screen center
	$Sprite.flip_h = mouse_pos < 0;
	
func move(delta):
	var velocity = Vector2()
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		position += velocity * delta
	
