extends Area2D

var selected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)

func _on_Tui_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("tui_click"):
		selected = true
	if Input.is_action_just_released("tui_click"):
		selected = false
