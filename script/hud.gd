extends Control

@onready var counter = $Container/orbs_container/orbs_count as Label

# Called when the node enters the scene tree for the first time.
func _ready():
	counter.text = str(Global.orb)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter.text = str(Global.orb)
	if Global.orb == 7:
		get_tree().change_scene_to_file("res://scenes/boneco.tscn") #vc ganhou
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
