extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var object_list = ["Bottle", "Wine glass", "Cup", "Fork", "Knife", "Spoon", "Bowl", "Banana", "Apple", "Sandwich", "Orange", "Broccoli", "Carrot", "Hot dog", "Pizza", "Doughnut", "Cake", "Chair", "Sofa", "Pottedplant", "Bed", "Diningtable", "Toilet", "Tvmonitor", "Laptop", "Mouse", "Remote", "Keyboard", "Cell phone", "Microwave", "Oven", "Toaster", "Sink", "Refrigerator", "Book", "Clock", "Vase", "Scissors", "Teddy bear", "Hair drier", "Toothbrush"]
var camera = 0
const time_lim = 30
var time_elapsed := 30.0
onready var clock_node = get_node("clock_output")
onready var object_node = get_node("object label")
var random = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	change_object()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_elapsed -= delta
	#print(time_elapsed)
	var str_time = str(time_elapsed)
	str_time = str_time.substr(0, 4)
	if time_elapsed < 10:
		str_time = str_time.substr(0,3)
	clock_node.text = str_time
	if time_elapsed <= 0:
		timer_end()
	


func _on_Back_pressed():
	get_tree().change_scene("res://Scenes/menu.tscn")


func _on_Button_pressed():
	if camera == 0:
		camera = 1
	else:
		camera = 0
	print(camera)
	

func timer_end():
	# add a delay between rounds
	time_elapsed = time_lim
	change_object()


func change_object():
	var object_num = random.randi_range(1, 41) + OS.get_ticks_msec()
	object_num = object_num % 25
	
	object_node.text = object_list[object_num]
	
