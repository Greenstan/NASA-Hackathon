extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	$VisitButton.visible = true


func _on_visit_button_pressed() -> void:
	$Map.visible = false
	$Kuwait.visible = false
	$VisitButton.visible = false
	$Kuwait2.visible = true
