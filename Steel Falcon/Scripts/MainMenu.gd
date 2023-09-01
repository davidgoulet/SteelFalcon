extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _on_button_pressed():
	var scene := load("res://Scenes/Main.tscn") as PackedScene
	get_tree().change_scene_to_packed(scene)
