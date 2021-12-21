extends Node2D

onready var weapons_container = $HandPosition2D

onready var weapons = weapons_container.get_children()

var max_slot_size = 3
var weapon_slots_size = 3
var cur_slot = 0
var cur_weapon = null

func _ready():
	switch_to_weapon_slot(cur_slot)
	pass

func switch_to_next_weapon():
	cur_slot = (cur_slot + 1) % weapon_slots_size
	switch_to_weapon_slot(cur_slot)

func switch_to_prev_weapon():
	cur_slot = posmod((cur_slot - 1), weapon_slots_size)
	switch_to_weapon_slot(cur_slot)

func switch_to_weapon_slot(slot_ind: int):
	if slot_ind < 0 or slot_ind >= weapon_slots_size:
		return
	disable_all_weapons()
	cur_weapon = weapons[slot_ind]
	if cur_weapon.has_method("set_active"):
		cur_weapon.set_active()
	else:
		cur_weapon.visible = true

func disable_all_weapons():
	for weapon in weapons:
		if weapon.has_method("set_inactive"):
			weapon.set_inactive()
		else:
			weapon.visible = false
