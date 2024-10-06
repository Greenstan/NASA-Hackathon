extends Sprite2D

var hovered : bool = false
signal battery_done
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("left_click") and hovered:
		global_position = get_global_mouse_position()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "BinBattery":
		battery_done.emit()
		queue_free()


func _on_area_2d_mouse_entered() -> void:
	hovered = true
	print("hovered")


func _on_area_2d_mouse_exited() -> void:
	hovered = false
