extends Node2D

#Animations objects
onready var weapon_animation_tree = $AnimationTree
onready var weapon_animation_mode = weapon_animation_tree["parameters/playback"]
onready var hands_animation_tree = $AnimationTree

onready var weapons = [$None, $Cutlass, $Halberd, $Bow]
var mirrored: bool

var active_weapon
var mouse_angle = 0


func look_at_mouse(angle): #change hand appearance to look at mouse
	if active_weapon.state == Weapons.states.Idle or active_weapon.state == Weapons.states.Blocking:  # change only when weapon is not attackng
		mouse_angle = angle
	active_weapon.look_at_mouse(angle, mirrored) #Make active weapon look at mouse

func ready(target):
	for weapon in weapons:
		weapon.init(target)
	active_weapon = weapons[0]

func change_weapon(new_weapon):
	active_weapon = weapons[new_weapon]
	for weapon in weapons:
		weapon.visible = false
	active_weapon.set_active(weapon_animation_mode)

func idle(unprepare=false): #this will be called from animation
	if active_weapon.state != Weapons.states.Preparing or unprepare:
		active_weapon.idle(weapon_animation_mode)
	
func primary_attack():
	if active_weapon.type == "Melee":
		if active_weapon.state == Weapons.states.Idle:
			active_weapon.primary_attack(weapon_animation_mode)
	elif active_weapon.type == "Ranged":
		if active_weapon.state == Weapons.states.Idle:
			active_weapon.prime(weapon_animation_mode)
		else:
			active_weapon.click_queued = true
			
func primary_release():
	if active_weapon.type == "Ranged":
		if active_weapon.state == Weapons.states.Idle:
			active_weapon.primary_attack(weapon_animation_mode)
		else:
			active_weapon.click_queued = false

func secondary_attack():
	if active_weapon.type == "Melee":
		if active_weapon.state == Weapons.states.Idle:
			active_weapon.secondary_attack(weapon_animation_mode)
			
func block():
	if active_weapon.type == "Melee":
		if active_weapon.state == Weapons.states.Idle:
			active_weapon.block(weapon_animation_mode)
			
func prepare():
	if active_weapon.type == "Melee":
		if active_weapon.state == Weapons.states.Idle:
			active_weapon.prepare(weapon_animation_mode)

