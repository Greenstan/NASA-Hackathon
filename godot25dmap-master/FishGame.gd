extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var counter = 0

onready var shit = load("res://ShitButton.tscn")

# Called when the node enters the scene tree for the first time.
#func _ready():
#	print(get_viewport().get_visible_rect())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func increase_score():
	counter += 1
	$"Score Value".text = str(counter)


func _on_SpawnTimer_timeout():
	print("Ended")
	var random_x = rng.randi_range(0, 1642)
	var random_y = rng.randi_range(0, 1024)
	
	var shit_instance = shit.instance()
	shit_instance.rect_position = Vector2(random_x,random_y)
	add_child(shit_instance)
	shit_instance.connect("pressed", shit_instance, "_on_ShitButton_pressed")
	shit_instance.connect("dead", self, "increase_score")

	$SpawnTimer.start()
