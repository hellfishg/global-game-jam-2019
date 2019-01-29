extends Area2D

export(String) var item1
export(String) var item2
export(String) var cerrado

var text_actual = null
var salida = Vector2()
var tocado = false
var pj

func _ready():
	pass

func _on_Are_teleport_body_entered(body):
	if body.is_in_group("player"):
		tocado = true
		pj = body
		print(cerrado)
		print("tocado")
			
		#abierto
		if tocado && cerrado == "false":
			teleport(body)

func _on_Are_teleport_body_exited(body):
	tocado = false
	if text_actual != null:
		text_actual.queue_free()
		text_actual = null
	print("no_tocado")

func _on_kin_Pj_accion():
	if tocado && cerrado == "true":
		#mecanica de las llaves.
		item1()
		
		
func item1():
	if text_actual == null:
		if pj.inv_slot[pj.inv_puntero] != item1:
			speak("SE NECESITA UNA LLAVE!")
		else:
			pj.inv_slot[pj.inv_puntero] = "vacio" 
			cerrado = "false"
			teleport(pj)
	
func speak(text):
	var container_text = load("res://alphaTest/Label.tscn").instance()
	container_text._text(text)
	add_child(container_text)
	text_actual = container_text

func teleport(body):
	#Si hay paso:
	salida = body.position
	salida.x -= 80
	body.position = salida
#	get_node("../../scriptGlobal").inv_slot = body.inv_slot 
#	get_node("../../scriptGlobal").inv_slot[0] = "pepe"
#	print (get_node("../../scriptGlobal").inv_slot)


	get_node("/root/globlal").inv_puntero = 4
	get_node("/root/globlal").inv_slot = body.inv_slot
	
	print(get_node("/root/globlal").inv_puntero)
	print(get_node("/root/globlal").inv_slot)
	

	var packed_scene = PackedScene.new()
	packed_scene.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://alphaTest/my_sceneSave.tscn", packed_scene)
	get_tree().change_scene("res://alphaTest/LevelFinal.tscn")	



