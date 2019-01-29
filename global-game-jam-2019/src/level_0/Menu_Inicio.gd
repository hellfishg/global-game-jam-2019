extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var boton

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	get_node("/root/Global").inv_slot = ["vacio", "vacio","vacio","vacio"]
	get_node("/root/Global").alcoholEnSangre = 0
	get_node("/root/Global").level2_On = 0
	pass

func _process(delta):
	if Input.is_action_just_pressed("joy_ar"):
		$inicio.grab_focus()
		boton = "ar"
	if Input.is_action_just_pressed("joy_ab"):
		$salir.grab_focus()
		boton = "ab"
	if Input.is_action_just_pressed("joy_accion") or Input.is_action_just_pressed("joy_salto"):
		if boton == "ar":
			get_tree().change_scene("res://level_0/Controles.tscn")
		if boton == "ab":
			get_tree().quit()