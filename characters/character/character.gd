extends CharacterBody3D
class_name character

@export_category("Camera")
@export var camera_sensitivity = 5.0
@export var rotation_speed = 5.0

@export_category("Movement")
@export var walk_speed = 5.0
@export var friction = 5.0
@export var jump_height = 5.0

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var jumping = false

@onready var spring_arm = $spring_arm
@onready var model = $mesh

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	velocity.y += -gravity * delta
	get_move_input(delta)
	move_and_slide()
	Input.set_use_accumulated_input(false)

	if velocity.length() > 1.0:
		model.rotation.y = lerp_angle(model.rotation.y, spring_arm.rotation.y, rotation_speed * delta)
	if is_on_floor() and Input.is_action_just_pressed("ch_jump"):
		velocity.y = jump_height
		jumping = true

func get_move_input(delta):
	var vy = velocity.y
	velocity.y = 0
	var input = Input.get_vector("ch_move_left", "ch_move_right", "ch_move_forwards", "ch_move_backwards")
	var dir = Vector3(input.x, 0, input.y).rotated(Vector3.UP, spring_arm.rotation.y)
	velocity = lerp(velocity, dir * walk_speed, friction * delta)
	velocity.y = vy
 
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		spring_arm.rotation.x -= event.relative.y * camera_sensitivity*0.0003
		spring_arm.rotation_degrees.x = clamp(spring_arm.rotation_degrees.x, -90.0, 50.0)
		spring_arm.rotation.y -= event.relative.x * camera_sensitivity*0.0003

func _process(delta):
		spring_arm.rotation.y -= Input.get_axis("ch_look_left", "ch_look_right") * camera_sensitivity*0.005
		spring_arm.rotation_degrees.x = clamp(spring_arm.rotation_degrees.x, -90.0, 50.0)
		spring_arm.rotation.x -= Input.get_axis("ch_look_up", "ch_look_down") * camera_sensitivity*0.005
