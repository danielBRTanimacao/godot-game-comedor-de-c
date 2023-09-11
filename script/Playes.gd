extends CharacterBody3D

var speed
const WALK_SPEED = 5.0
const SPRINT_SPEED = 8.0
const SENSITIVY = 0.003

var gravity = 9.8

@onready var head = $Head
@onready var camera = $Head/Camera3D

const BASE_FOV = 75.0
const FOV_CHANGE = 1.5

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVY)
		camera.rotate_x(-event.relative.y * SENSITIVY)
		camera.rotation.x = clamp(rotation.x, deg_to_rad(-40), deg_to_rad(60))


func _physics_process(delta):
	if Input.is_action_pressed('sprint'):
		speed = SPRINT_SPEED
	else:
		speed = WALK_SPEED
	
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = 0.0
		velocity.z = 0.0
	
	#FOV
	var velocity_changed = clamp(velocity.length(), 0.5, SPRINT_SPEED * 2)
	var target_fov = BASE_FOV + FOV_CHANGE * velocity_changed
	camera.fov = lerp(camera.fov, target_fov, delta * 8.0)

	move_and_slide()
