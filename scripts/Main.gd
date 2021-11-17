extends Spatial

# Minijuegos
onready var tui_viewport = $Minijuego/TuiViewport
onready var tui_minigame = $Minijuego/TuiViewport/Viewport/TuiMinigame

# Called when the node enters the scene tree for the first time.
func _ready():
	var _err = tui_minigame.connect("tui_win", self, "_on_tui_win")

func _unhandled_key_input(event):
	if event.scancode == KEY_C and event.is_pressed():
		_iniciar_tui_minijuego()

func _iniciar_tui_minijuego():
	tui_minigame.init()
	tui_viewport.show()

func _on_tui_win():
	tui_viewport.hide()
