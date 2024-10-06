extends Node2D

var plastic = preload("res://plastic_bag.tscn")
var rng = RandomNumberGenerator.new()
var counter = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spawn_timer_timeout() -> void:
	print("Ended")
	var random_x = rng.randi_range(0, 1642)
	var random_y = rng.randi_range(0, 1024)
	
	var shit_instance = plastic.instantiate()
	shit_instance.position = Vector2(random_x,random_y)
	add_child(shit_instance)
	shit_instance.dead.connect(on_dead)
	#shit_instance.pressed.connect(_on_pressed)
	#shit_instance.connect("pressed", shit_instance, "_on_ShitButton_pressed")
	#shit_instance.connect("dead", self, "increase_score")

	$SpawnTimer.start()
	
	
func on_dead():
	counter += 1
	$ScoreValue.text = str(counter)
