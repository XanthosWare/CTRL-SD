extends State

onready var duration_timer = $DashDurationTimer
onready var cooldown_timer = $Cooldown

export var cooldown_duration: int = 5

export var dash_duration: int = 1
export var dash_speed: int = 200

export var damage_value: float = 10
export var knockback_value: float = 20

var targetGroups
var direction

func enter(msg := {}) -> void:
	if !cooldown_timer.is_stopped():
		state_machine.transition_to("Chase")
		return
	
	cooldown_timer.wait_time = cooldown_duration
	cooldown_timer.start()
	
	if owner.controlled:
		targetGroups = ["enemy"]
	else:
		targetGroups = ["player1", "player2"]

	var targets = owner.find_targets_in_area(targetGroups, owner.hit_range)
	if targets.size() == 0:
		state_machine.transition_to("Chase")
		return
		
	direction = (targets[0].global_position - owner.global_position).normalized() * dash_speed
	
	owner.play_animation("Attack")
	
func start_dash():
	duration_timer.wait_time = dash_duration
	duration_timer.start()

func is_dashing():
	return !duration_timer.is_stopped()

func end_dash():
	if is_dashing():
		owner.set_animation(0.4)
	else:
		yield(owner.anim_player, "animation_finished")
		state_machine.transition_to("Chase")
		pass
#		

func physics_update(delta):
	if is_dashing():
		owner.velocity = direction
		owner.damage_area(targetGroups, owner.hit_range2, damage_value, knockback_value)
