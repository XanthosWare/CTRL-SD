extends State

func enter(msg := {}) -> void:
	owner.play_animation("Death", "Animations")
	pass
	

func enemy_drop():
	# drop is a number between 0 and 99
	var drop = randi() % 100

	# if drop is strictly less than our percentage, then drop something
	if drop < owner.ITEM_DROP_PERCENT:
		var drop_list = []
		for key in Global.ITEM_DROP_WEIGHTS:
			for _i in range(Global.ITEM_DROP_WEIGHTS[key]):
				drop_list.append(key)

		# index is a number between 0 and list size - 1
		var index = randi() % drop_list.size()
		# load the scene at index
		var scene = str("res://src/entities/items/", drop_list[index], ".tscn")
		
		print(scene)
		
		instance_scene(load(scene).instance())

func instance_scene(instance):
	instance.global_position = owner.global_position
	Global.items.add_child(instance)
	

func delete_enemy():
	#enemy_drop()
	print("1")
	if Global.main == null:
		owner.queue_free()
		return
	Global.main.update_points(100)
	Global.main.enemy_count = Global.main.enemy_count - 1
	if Global.main.enemy_count == 0:
		Global.main.update_wave()
	
	Global.main.update_board()
	
	owner.queue_free()
