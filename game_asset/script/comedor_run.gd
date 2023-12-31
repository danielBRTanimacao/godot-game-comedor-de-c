extends CharacterBody3D

var player = null
var SPEED = 6.0
const ATTACK_RANGE = 1

@export var player_path = "../../../Playes"

@onready var nav_agent = $comedor_run/NavigationAgent3D

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node(player_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector3.ZERO
	nav_agent.set_target_position(player.global_transform.origin)
	var next_nav_point = nav_agent.get_next_path_position()
	velocity = (next_nav_point - global_transform.origin).normalized() * SPEED
	
	look_at(Vector3(player.global_position.x, global_position.y, player.global_position.z), Vector3.UP)
	
	_target_in_range()
	move_and_slide()

	if Global.orb == 3:
		SPEED = 6.5
	if Global.orb == 4:
		SPEED = 7
	if Global.orb == 6:
		SPEED = 8.5


func _target_in_range():
	if global_position.distance_to(player.global_position) < ATTACK_RANGE:
		get_tree().change_scene_to_file("res://scenes/cntrols_scenes/die.tscn") # vc morreu
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
