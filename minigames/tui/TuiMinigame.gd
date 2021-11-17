extends Node2D

signal tui_win

onready var lector = $Lector
onready var tui = $Tui
onready var p1 = $Position1
onready var p2 = $Position2

onready var l = p1.position.x
onready var r = p2.position.x
onready var u = p1.position.y
onready var d = p2.position.y
	
func _ready():
	var _err = lector.connect("area_entered", self, "_on_lector_area_entered")

func _on_lector_area_entered(_area):
	tui.selected = false
	emit_signal("tui_win")

func init():
	var x = rand_range(l,r)
	var y = rand_range(u,d)
	tui.global_position = Vector2(x,y)
