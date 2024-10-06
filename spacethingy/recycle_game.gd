extends Node2D

var water : bool = false
var battery : bool = false
var leaf : bool = false

signal finished_all

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_battery_battery_done() -> void:
	battery = true
	if water and leaf and battery:
		finished_all.emit()


func _on_water_2_water_done() -> void:
	water = true
	if water and leaf and battery:
		finished_all.emit()

func _on_leaf_leaf_done() -> void:
	leaf = true
	if water and leaf and battery:
		finished_all.emit()
