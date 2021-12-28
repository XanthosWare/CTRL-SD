extends State

onready var duration_timer = $DashDurationTimer
onready var cooldown_timer = $Cooldown

export var cooldown_duration: float = 5

export var dash_duration: float = 3
export var dash_speed: int = 1000


var direction

func enter(msg := {}) -> void:
	if !cooldown_timer.is_stopped():
		state_machine.transition_to("Chase")
		return
	cooldown_timer.wait_time = cooldown_duration
	cooldown_timer.start()

	var targets = owner.find_targets_in_area(["player"], owner.engage_range)
	if targets.size() == 0:
		state_machine.transition_to("Chase")
		return
		
	direction = (targets[0].global_position - owner.global_position).normalized() * dash_speed
	
	owner.play_animation("Attack", "Animations")
	
func start_dash():
	duration_timer.wait_time = dash_duration
	duration_timer.start()

func is_dashing():
	return !duration_timer.is_stopped()

func end_dash():
	if is_dashing():
		owner.set_animation(0.6, "Animations")
	else:
		yield(owner.animation_machine.find("Animations"), "animation_finished")
		state_machine.transition_to("Chase")
		pass
#		

func physics_update(delta):
	if owner.is_dead():
		state_machine.transition_to("Death")
	if is_dashing():
		owner.velocity = direction
		#owner.damage_area(["player"], owner.hitbox, damage_value, knockback_value)
