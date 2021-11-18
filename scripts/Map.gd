extends Node2D

signal map_close

onready var tween = $Tween
onready var map = $Dcc

# Areas
onready var entrada = $Dcc/AreaEntrada
onready var picarte = $Dcc/AreaPicarte
onready var salita  = $Dcc/AreaSalita

# Called when the node enters the scene tree for the first time.
func _ready():
	init()
	var _err1 = entrada.connect("input_event", self, "_on_click_entrada")
	var _err2 = picarte.connect("input_event", self, "_on_click_picarte")
	var _err3 =  salita.connect("input_event", self, "_on_click_salita")

func _on_click_entrada(_a,_b,_c):
	if Input.is_action_just_pressed("map_click"):
		selected()
		yield(tween, "tween_completed")
		emit_signal("map_close")
func _on_click_picarte(_a,_b,_c):
	if Input.is_action_just_pressed("map_click"):
		selected()
		yield(tween, "tween_completed")
		emit_signal("map_close")
func _on_click_salita(_a,_b,_c):
	if Input.is_action_just_pressed("map_click"):
		selected()
		yield(tween, "tween_completed")
		emit_signal("map_close")

func init():
	tween.interpolate_property(map, "position:y", 1920, 0, 1, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()

func selected():
	tween.interpolate_property(map, "position:y", 0, 1920, 1, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()
