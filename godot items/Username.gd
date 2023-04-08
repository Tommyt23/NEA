extends Node2D


onready var line_edit = get_node("LineEdit")


# Called when the node enters the scene tree for the first time.
func _ready():
	line_edit.grab_focus()


func move(target):
	var move_tween = get_node("move_tween")
	move_tween.interpolate_property(self, "position", position, target, 2, Tween.TRANS_QUINT, Tween.EASE_OUT)
	move_tween.start()
