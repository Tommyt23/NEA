extends Node2D

onready var line_text = get_node("Username/LineEdit")
onready var hslider = get_node("Volume/background/HSlider")
onready var username_file = "res://Stored_values/username_txt"
onready var volume_file = "res://Stored_values/volume_txt"


var master_bus = AudioServer.get_bus_index("Master")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#retrieve username
	var file = File.new()
	file.open(username_file, file.READ)
	var username = file.get_as_text()
	line_text.text = username
	file.close()
	
	#retrieve volume
	file.open(volume_file, file.READ)
	var volume = file.get_float()
	hslider.value = volume
	file.close()
	
	
#func Start_pressed():
#	get_node("MainGame").move(Vector2(0,0))
#	get_node("game_back").move(Vector2(0,0))	

func Settings_pressed():
	$Buttonsound.play()
	get_node("Menu").move(Vector2(-576, 475))
	get_node("Settings").move(Vector2(0, 475))
	get_node("back").move(Vector2(-576, 0))

func back_pressed():
	$Buttonsound.play()
	get_node("Menu").move(Vector2(0, 475))
	get_node("Settings").move(Vector2(576, 475))
	get_node("back").move(Vector2(0, 0))

func game_back_pressed():
	$Buttonsound.play()
	get_node("game_back").move(Vector2(0, 1024))
	get_node("MainGame").move(Vector2(0, 1024))

func volume_pressed():
	$Buttonsound.play()
	get_node("Volume").move(Vector2(0, 312))
	get_node("back").move(Vector2(-1024, 0))
	get_node("settings_back").move(Vector2(0, 0))
	
func settings_back_pressed():
	$Buttonsound.play()
	get_node("back").move(Vector2(-576, 0))
	get_node("Volume").move(Vector2(1024, 312))
	get_node("settings_back").move(Vector2(1024, 0))
	get_node("Brightness").move(Vector2(1728, 312))
	get_node("Username").move(Vector2(2304, 312))


func Brighness_pressed():
	$Buttonsound.play()
	get_node("settings_back").move(Vector2(0, 0))
	get_node("back").move(Vector2(-1024, 0))
	get_node("Brightness").move(Vector2(13, 312))

func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)
		
	var file = File.new()
	file.open(volume_file, file.WRITE)
	file.store_real(value)
	file.close()
	


func username_entered(new_text):
	var file = File.new()
	file.open(username_file, file.WRITE)
	file.store_string(new_text)
	file.close()


func username_pressed():
	$Buttonsound.play()
	get_node("Username").move(Vector2(0, 312))
	get_node("back").move(Vector2(-1024, 0))
	get_node("settings_back").move(Vector2(0, 0))


func _on_Start_pressed():
	$Buttonsound.play()
	get_tree().change_scene("res://Scenes//Game.tscn")


func _on_LeaderBoard_pressed():
	$Buttonsound.play()
	OS.shell_open("http://docs.godotengine.org/en/3.0/classes/class_os.html#class-os-shell-open")
