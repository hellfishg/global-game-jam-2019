extends Area2D

export(String) var item
var tocado = false
export (bool) var vivo
var pj
var text_actual

func _ready():
	pass

func _process(delta):
	pass
	

func _on_Contenedor_body_entered(body):
	if body.is_in_group("player"):
		tocado = true
		pj = body
		print("tocado")

func _on_Contenedor_body_exited(body):
	tocado = false
	if text_actual != null:
		text_actual.queue_free()
		text_actual = null
	print("no_tocado")

func _on_Kin_Pj_accion():		
	if text_actual == null:
		speak("¿Quién hubiera esperado que había alcohol al final del arcoiris?")

			
func speak(text):
	var container_text = load("res://alphaTest/Label.tscn").instance()
	container_text._text(text)
	add_child(container_text)
	text_actual = container_text
#		#pasan 3: esp, no esp, botella, botella sin esp
#		var lleno = true
#
#		#tiene espacio:
#		for i in range(4):
#			if pj.inv_slot[i] == "vacio":
#				pj.inv_slot[i] = item
#				vivo = false
#				lleno = false
#				break
#
#		#no tiene espacio y es botella:
#		if item == "botella" && lleno:
#			#toma alcohol
#			print("toma alcohol!!")
#
#		print(pj.inv_slot)
#

