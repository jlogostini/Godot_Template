extends Control

@onready var main_menu = $main_menu 
@onready var options_menu = $options_menu 
@onready var extras_menu = $extras_menu

var options_menu_active = false
var extras_menu_active = false

func _ready():
	$main_menu/buttons_container/buttons_vertical_box/play_button.grab_focus()

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://worlds/template_world/template_world.tscn")

# Open Options Menu
func _on_options_button_pressed():
	main_menu.visible = false
	options_menu.visible = true
	$options_menu/VBoxContainer/resolution_button.grab_focus()
	options_menu_active = true

# Open Extras Menu
func _on_extras_button_pressed():
	main_menu.visible = false
	extras_menu.visible = true
	$extras_menu/test_button.grab_focus()
	extras_menu_active = true

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		# Close Options Menu
		if options_menu_active:
			options_menu.visible = false
			options_menu_active = false
			main_menu.visible = true
			$main_menu/buttons_container/buttons_vertical_box/options_button.grab_focus()
		# Close Extras Menu
		if extras_menu_active:
			extras_menu.visible = false
			extras_menu_active = false
			main_menu.visible = true
			$main_menu/buttons_container/buttons_vertical_box/extras_button.grab_focus()

# Quit Game
func _on_quit_button_pressed():
	get_tree().quit()
