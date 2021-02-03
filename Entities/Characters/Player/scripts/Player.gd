extends KinematicBody2D

#player walking speed
export var speed = 100

export var roll_speed_multiplier = 1.2
export var falling_speed = 60

onready var animation_tree = $Sprite/AnimationTree
onready var animation_mode = animation_tree["parameters/playback"]
onready var sprites = $Sprite
onready var weapons = $Sprite/Weapons
export(Weapons.weapons) var weapon

enum states {
	Idle,
	Walking,
	Rolling,
	Kicking,
	Falling,
}
var state = states.Idle

var velocity


func _init():
	Player.player_ref = self

func _ready():
	weapons.weapon_id = weapon
	weapons.target = Weapons.targets.Enemy
	weapons.ready()
	scale = Vector2(1,1)

func _physics_process(delta):
	move(delta)
	
func _process(_delta):
	if state != states.Rolling:
		look_at_mouse()
		weapons.look_at_mouse(Utils.mouse_angle())

func move(delta):
	if state == states.Rolling:
		var _suc = move_and_slide(velocity * roll_speed_multiplier)
	elif state == states.Falling:
		position += Vector2(0, delta * falling_speed)
	elif state != states.Kicking:
		velocity = Vector2()
		velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		if velocity.length() > 0: # if moved
			velocity = velocity.normalized() * speed
			var result = move_and_slide(velocity)
			if result.length() > 0: # not stopped by collision
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
	if mouse_angle > 105 or mouse_angle < -105: #some space as to not flicker at border
		weapons.mirrored = true
		scale = Vector2(1, -1)
		rotation_degrees = -180
	elif mouse_angle < 75 and mouse_angle >= 0 or\
		mouse_angle > -75 and mouse_angle <= 0:
		weapons.mirrored = false 
		scale = Vector2(1, 1)
		rotation_degrees = -0
		
func _input(event): #  Call methods on hands on click event
		if event.is_action_pressed("primary_attack"):
			weapons.primary_attack()
		elif event.is_action_pressed("secondary_attack"):
			weapons.secondary_attack()
		elif event.is_action_released("primary_attack"):
			weapons.primary_release()
		elif event.is_action_pressed("block"):
			weapons.block()
		elif event.is_action_released("block"):
			weapons.idle()
		elif event.is_action_pressed("roll"):
			if state == states.Walking:
				roll()
		elif event.is_action_pressed("kick"):
			kick()

func roll():
	state = states.Rolling
	Player.stats.vulnerable = false
	animation_mode.travel("Roll")
	if velocity.x < 0:
		weapons.mirrored = true
		scale = Vector2(1, -1)
		rotation_degrees = -180
	else:
		weapons.mirrored = false 
		scale = Vector2(1, 1)
		rotation_degrees = -0
	
func kick():
	state = states.Kicking
	animation_mode.travel("Kick")
	
func fall(): # Called from Falling_area
	state = states.Falling
	animation_mode.start("Falling") # Immidiately switch to falling

func change_state(state_id): #called from animations
	state = state_id
	if state != states.Rolling:
		Player.stats.vulnerable = true

func hit(type, damage): # Will apply damage, called from weapons
	if type == Weapons.types.Swing and weapons.active_weapon.state != Weapons.states.Blocking:
		Player.swing(damage)
	elif type == Weapons.types.Stab:
		Player.stab(damage)

func die(): # hide from from scene and then remove. Should be replaced with death menu
	set_deferred("visible", false)
	animation_mode.stop()
	queue_free()

