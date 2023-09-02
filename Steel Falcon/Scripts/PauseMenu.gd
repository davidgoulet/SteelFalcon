extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_quit_button_button_down():
	var scene := load("res://Scenes/MainMenu.tscn") as PackedScene
	get_tree().change_scene_to_packed(scene)

func _on_restart_button_button_down():
	var scene := load("res://Scenes/Main.tscn") as PackedScene
	get_tree().change_scene_to_packed(scene)


func _on_resume_button_button_down():
	self.hide()
