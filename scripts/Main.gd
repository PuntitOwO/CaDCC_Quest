extends Spatial

# Minijuegos
onready var tui_viewport = $Minijuego/TuiViewport
onready var tui_minigame = $Minijuego/TuiViewport/Viewport/TuiMinigame
onready var map_viewport = $Map/MapViewport
onready var map_scene    = $Map/MapViewport/Viewport/Map

# Called when the node enters the scene tree for the first time.
func _ready():
	var _err1 = tui_minigame.connect("tui_win", self, "_on_tui_win")
	var _err2 = map_scene.connect("map_close", self, "_on_map_close")

func _unhandled_key_input(event):
	if event.scancode == KEY_C and event.is_pressed():
		_iniciar_tui_minijuego()
	if event.scancode == KEY_M and event.is_pressed():
		_abrir_mapa()

func _iniciar_tui_minijuego():
	tui_minigame.init()
	tui_viewport.show()

func _on_tui_win():
	tui_viewport.hide()

func _abrir_mapa():
	map_viewport.show()
	map_scene.init()

func _on_map_close():
	map_viewport.hide()
