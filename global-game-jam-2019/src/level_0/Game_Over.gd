extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_just_pressed("joy_seleccion") or Input.is_action_just_pressed("joy_accion"):
		get_tree().change_scene("res://level_0/Menu_Inicio.tscn")