extends Node2D

var placed_tree = false
var placed_solar = false
var placed_wind = false
var tree = preload("res://tree.tscn")
var wind = preload("res://WindTurbine.tscn")
var solar = preload("res://SolarPanel.tscn")

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed() and placed_tree:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
		var tree_instance = tree.instantiate()
		var tree_position = get_global_mouse_position()
		tree_instance.position = tree_position
		add_child(tree_instance)
		placed_tree = false
		var carbons = $Carbons.get_children()
		var i = 0
		for carbon in carbons:
			var dist = tree_instance.position.distance_to(carbon.position)
			if dist < 100:
				carbon.queue_free()
				i += 1
				if len(carbons) == 1:
					$AQ.visible = false
					$Warning2.visible = true
				#break
			if i == 2:
				break
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed() and placed_solar:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
		var tree_instance = solar.instantiate()
		var tree_position = get_global_mouse_position()
		tree_instance.position = tree_position
		add_child(tree_instance)
		placed_solar = false
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed() and placed_wind:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
		var tree_instance = wind.instantiate()
		var tree_position = get_global_mouse_position()
		tree_instance.position = tree_position
		add_child(tree_instance)
		placed_wind = false


func _on_tree_button_pressed() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	placed_tree = true


func _on_solar_button_pressed() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	placed_solar = true


func _on_wind_button_pressed() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	placed_wind = true


func _on_warning_1_pressed() -> void:
	$Warning1.visible = false
	$AQ.visible = true
	$Carbons.visible = true
	


func _on_warning_2_pressed() -> void:
	$Warning2.visible = false
	$FishGame.visible =true
	$FishGame/SpawnTimer.start()
	$FishGameTimer.start()


func _on_fish_game_timer_timeout() -> void:
	$FishGame.queue_free()


func _on_recycle_game_finished_all() -> void:
	$RecycleGame.visible = false
