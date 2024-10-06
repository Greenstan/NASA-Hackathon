extends Sprite2D

var hovered : bool = false
signal leaf_done

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("left_click") and hovered:
		global_position = get_global_mouse_position()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "BinLeaf":
		leaf_done.emit()
		queue_free()


func _on_area_2d_mouse_entered() -> void:
	hovered = true
	print("hovered")


func _on_area_2d_mouse_exited() -> void:
	hovered = false
