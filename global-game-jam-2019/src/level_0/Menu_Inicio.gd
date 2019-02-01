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
	var dir = Directory.new()
	dir.remove("res://sceneSaveLevel1.tscn")
	dir.remove("res://sceneSaveLevel2.tscn")
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

func _on_inicio_pressed():
	get_tree().change_scene("res://level_0/Controles.tscn")


func _on_salir_pressed():
	get_tree().quit()
