extends Control

@onready var main_menu = $main_menu 
@onready var options_menu = $options_menu 
var useingoptions = false

func _ready():
	$main_menu/margin_container/vertical_box_container/play_button.grab_focus()

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://worlds/template_world/template_world.tscn")

func _on_options_button_pressed():
	main_menu.visible = false
	options_menu.visible = true
	$options_menu/VBoxContainer/resolution_button.grab_focus()
	useingoptions = true

func _input(event):
	if useingoptions:
		if Input.is_action_just_pressed("ui_cancel"):
			main_menu.visible = true
			options_menu.visible = false
			$main_menu/margin_container/vertical_box_container/options_button.grab_focus()
			useingoptions = false

func _on_quit_button_pressed():
	get_tree().quit()
