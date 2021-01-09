extends KinematicBody2D

#player walking speed
export var speed = 100

export var roll_speed_multiplier = 1.2

onready var animation_tree = $AnimationTree
onready var animation_mode = animation_tree["parameters/playback"]
onready var sprite = $Sprite
onready var hands = $Hands
export(Weapons.weapons) var weapon

enum states {
	Idle,
	Walking,
	Rolling,
	Kicking,
}
var state = states.Idle

var velocity

var hp
export(int) var max_hp

func _init():
	Player.player_ref = self

func _ready():
	hands.weapon_id = weapon
	hands.ready()
	hp = max_hp

func _process(delta):
	move(delta)
	look_at_mouse()
	hands.look_at_mouse(Utils.mouse_angle())

func move(delta):
	if state == states.Rolling:
		position += velocity * delta * roll_speed_multiplier
	else:
		velocity = Vector2() # get player velocity
		velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		if velocity.length() > 0: # if moved
			velocity = velocity.normalized() * speed
			position += (velocity * delta)
			state = states.Walking
			animation_tree.set('parameters/Roll/blend_position', Utils.vec_to_pos_blended(velocity))
			animation_mode.travel("Walk")
		else: # didn't move
			state = states.Idle
			animation_mode.travel("Idle")

func look_at_mouse(): #change player sprite to look at mouse
	var mouse_pos_blended = Utils.mouse_pos_blended()
	animation_tree.set('parameters/Idle/blend_position', mouse_pos_blended)
	animation_tree.set('parameters/Walk/blend_position', mouse_pos_blended)
	animation_tree.set('parameters/Kick/blend_position', mouse_pos_blended)
	var mouse_angle = Utils.mouse_angle()
	if state != states.Rolling:
		if mouse_angle > 105 or mouse_angle < -105: #some space as to not flicker at border
			sprite.flip_h = true
		elif mouse_angle < 75 and mouse_angle >= 0 or\
			mouse_angle > -75 and mouse_angle <= 0:
			sprite.flip_h = false 
		
func _input(event): #  Call methods on hands on click event
		if event.is_action_pressed("primary_attack"):
			hands.primary_attack()
		elif event.is_action_pressed("secondary_attack"):
			hands.secondary_attack()
		elif event.is_action_released("primary_attack"):
			hands.primary_release()
		elif event.is_action_pressed("roll"):
			if state == states.Walking:
				roll()
		elif event.is_action_pressed("kick"):
			kick()

func roll():
	state = states.Rolling
	animation_mode.travel("Roll")
	sprite.flip_h = Utils.vec_to_pos_blended(velocity).x < 0
	
func kick():
	state = states.Kicking
	animation_mode.travel("Kick")

func change_state(state_id):
	state = state_id

func damage(damage): # Will apply damage
	hp -= damage
	$Sprite.modulate = Color(1, hp/float(max_hp), hp/float(max_hp))
	if hp <= 0:
		die()

func die(): # hide strawman from scene, in the future it should be removed from the scene tree
	set_deferred("visible", false)
	queue_free()

