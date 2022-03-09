extends "res://src/entities/items/base_templates/base_item/base_item.gd"

export var heal_value = 20

func _ready():
	animation_machine.play_animation("Idle", "AnimationPlayer")

func action(_subject):
	print("action?")
	_subject.health_manager.heal(heal_value)
	animation_machine.play_animation("Pickup", "AnimationPlayer")
	yield(animation_machine.find("AnimationPlayer"), "animation_finished")
	queue_free()
