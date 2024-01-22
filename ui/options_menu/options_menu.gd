extends Control

@onready var resolution_button = $VBoxContainer/resolution_button
@onready var window_button = $VBoxContainer/window_button

func _ready():
	update_settings_list()
	$VBoxContainer/resolution_button.grab_focus()

func update_settings_list():
	resolution_button.add_item("640x480")
	resolution_button.add_item("800x600")
	resolution_button.add_item("960x540")
	resolution_button.add_item("1024x768")
	resolution_button.add_item("1280x720")
	resolution_button.add_item("1280x1024")
	resolution_button.add_item("1440x900")
	resolution_button.add_item("1440x960")
	resolution_button.add_item("1600x900")
	resolution_button.add_item("1600x1200")
	resolution_button.add_item("1680x1050")
	resolution_button.add_item("1920x800")
	resolution_button.add_item("1920x1080")
	resolution_button.add_item("1920x1200")
	resolution_button.add_item("1920x1280")
	resolution_button.add_item("2560x1080")
	resolution_button.add_item("2560x1440")
	
	window_button.add_item("Exclusive Fullscreen")
	window_button.add_item("Fullscreen")
	window_button.add_item("Windowed")

func _on_res_option_button_item_selected(index):
	var current_selected = index
	
	if current_selected == 0:
		DisplayServer.window_set_size(Vector2(640,480))

	if current_selected == 1:
		DisplayServer.window_set_size(Vector2(800,600))

	if current_selected == 2:
		DisplayServer.window_set_size(Vector2(960,540))

	if current_selected == 3:
		DisplayServer.window_set_size(Vector2(1024,768))

	if current_selected == 4:
		DisplayServer.window_set_size(Vector2(1280,720))

	if current_selected == 5:
		DisplayServer.window_set_size(Vector2(1280,1024))

	if current_selected == 6:
		DisplayServer.window_set_size(Vector2(1440,900))

	if current_selected == 7:
		DisplayServer.window_set_size(Vector2(1440,960))

	if current_selected == 8:
		DisplayServer.window_set_size(Vector2(1600,900))

	if current_selected == 9:
		DisplayServer.window_set_size(Vector2(1600,1200))

	if current_selected == 10:
		DisplayServer.window_set_size(Vector2(1680,1050))

	if current_selected == 11:
		DisplayServer.window_set_size(Vector2(1920,800))
		
	if current_selected == 12:
		DisplayServer.window_set_size(Vector2(1920,1080))
		
	if current_selected == 13:
		DisplayServer.window_set_size(Vector2(1920,1200))
		
	if current_selected == 14:
		DisplayServer.window_set_size(Vector2(1920,1280))
		
	if current_selected == 15:
		DisplayServer.window_set_size(Vector2(2560,1080))
		
	if current_selected == 16:
		DisplayServer.window_set_size(Vector2(2560,1440))
		

func _on_window_button_item_selected(index):
	var current_selected = index
	
	if current_selected == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		
	if current_selected == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		
	if current_selected == 2:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
