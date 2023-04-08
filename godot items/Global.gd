extends Node2D

const save_file = "res://stored_values/username.txt"
onready var nameNode = get_node("/root/Game/UI/MenuButtons/Username/LineEdit")

# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	file.open(save_file, file.READ)
	var username = file.get_as_text()
	print(username)
	file.close()


