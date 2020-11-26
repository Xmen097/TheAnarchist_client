extends Node2D

#Animations objects
onready var weapon_animation_tree = $Weapons/AnimationTree
onready var weapon_animation_mode = weapon_animation_tree["parameters/playback"]
onready var hands_animation_tree = $AnimationTree

var active_weapon: Node
var mouse_angle = 0

func look_at_mouse(): #change hand appearance to look at mouse
	if !active_weapon.attacking:  # change only when weapon is not attackng
		mouse_angle = Utils.mouse_angle()
	active_weapon.look_at_mouse(mouse_angle) #Make active weapon look at mouse
	
	hands_animation_tree.set('parameters/Hands_idle/blend_position', Utils.mouse_pos_blended())
	

func _input(event): #Call methods on active weapon on click event
	if event.is_action_pressed("primary_attack") and !active_weapon.attacking:
		active_weapon.primary_attack(weapon_animation_mode)
	if event.is_action_pressed("secondary_attack") and !active_weapon.attacking:
		active_weapon.secondary_attack(weapon_animation_mode)

func _ready():
	active_weapon = $Weapons/Cutlass
	active_weapon.init(weapon_animation_mode)

func _process(_delta): #every frame
	look_at_mouse()

func on_weapon_idle(): #this will be called from animation
	active_weapon.idle()
