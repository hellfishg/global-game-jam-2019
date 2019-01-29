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

func _on_Puerta_body_entered(body):
	if body.is_in_group("player"):
		print("tocado")
		tocado = true
		pj = body
		if cerrado == "false":
			teleport(body)

func _on_Puerta_body_exited(body):
	tocado = false
	if text_actual != null:
		text_actual.queue_free()
		text_actual = null
	print("no_tocado")

func _on_Kin_Pj_accion():
	if tocado && cerrado == "true":
		#mecanica de las llaves.
		print("accion")
		item1()
		
		
func item1():
	if text_actual == null:
		if pj.inv_slot[pj.inv_puntero] != item1:
			speak("Creo que roca ,sip ...hip.. entrar con un buena roca!")
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
	salida.x -= 130
	salida.y -= 20
	body.position = salida
#	get_node("../../scriptGlobal").inv_slot = body.inv_slot 
#	get_node("../../scriptGlobal").inv_slot[0] = "pepe"
#	print (get_node("../../scriptGlobal").inv_slot)

	#body.inv_slot = ["llave", "crowbar","moneda","queso"]
	
	get_node("/root/Global").inv_puntero = 4
	get_node("/root/Global").inv_slot = body.inv_slot
	
	print(get_node("/root/Global").inv_puntero)
	print(get_node("/root/Global").inv_slot)
	

#	var packed_scene = PackedScene.new()
#	packed_scene.pack(get_tree().get_current_scene())
#	ResourceSaver.save("res://sceneSaveLevel1.tscn", packed_scene)
#	get_tree().change_scene("res://level_2/level2_final.tscn")	


