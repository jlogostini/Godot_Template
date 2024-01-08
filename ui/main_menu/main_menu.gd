extends Control
 
func _ready():
	$margin_container/vertical_box_container/play_button.grab_focus()

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://worlds/template_world/template_world.tscn")
	

func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://ui/options_menu/options_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
