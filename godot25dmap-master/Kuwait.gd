extends Node2D


var placed = false
var tree = preload("res://Tree.tscn")
onready var progress_bar = get_node("CanvasLayer/Control/ProgressBar")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var carbons = get_tree().get_nodes_in_group("Co2")
	var value = (len(carbons)/7.0)*100
	progress_bar.value = value

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed() and placed == true:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
		var tree_instance = tree.instance()
		var tree_position = get_global_mouse_position()
		tree_instance.position = tree_position
		add_child(tree_instance)
		placed = false
		var carbons = get_tree().get_nodes_in_group("Co2")
		for carbon in carbons:
			var dist = tree_instance.position.distance_to(carbon.position)
			if dist < 100:
				carbon.queue_free()
				break
		
		
func _on_Button_pressed():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	placed = true
	
