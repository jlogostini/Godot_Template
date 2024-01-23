extends Control

@onready var main_menu = $main_menu 
@onready var options_menu = $options_menu 

var options_menu_active = false

func _ready():
	$main_menu/buttons_container/buttons_vertical_box/play_button.grab_focus()

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://worlds/template_world/template_world.tscn")

func _on_options_button_pressed():
	main_menu.visible = false
	options_menu.visible = true
	$options_menu/VBoxContainer/resolution_button.grab_focus()
	options_menu_active = true

func _input(event):
	if options_menu_active:
		if Input.is_action_just_pressed("ui_cancel"):
			main_menu.visible = true
			options_menu.visible = false
			$main_menu/buttons_container/buttons_vertical_box/options_button.grab_focus()
			options_menu_active = false

func _on_quit_button_pressed():
	get_tree().quit()
