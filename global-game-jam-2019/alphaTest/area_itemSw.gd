extends Area2D

export(String) var item
var tocado = false
var vivo = true
var pj

func _ready():

	pass

func _process(delta):
	pass
	

func _on_area_itemSw_body_entered(body):
	if body.is_in_group("player"):
		tocado = true
		pj = body
		print ("toca")


func _on_area_itemSw_body_exited(body):
	tocado = false
	print ("no-toca")

func _on_kin_Pj_accion():
	if tocado && vivo:
		
		#mecanica de si existe o no el objeto:
#		if pj.inv_slot[pj.inv_puntero] == "vacio":
#			print(pj.inv_slot)
#			pj.inv_slot[pj.inv_puntero] = item
#			print ("vacio ")
#			print(pj.inv_slot)
#			self.queue_free()
			
#		else:
		for i in range(4):
			if pj.inv_slot[i] == "vacio":
				pj.inv_slot[i] = item
				self.queue_free()
				break
		
		if pj.inv_slot[pj.inv_puntero] != "botella":
			var itemDejado = pj.inv_slot[pj.inv_puntero]
			pj.inv_slot[pj.inv_puntero] = item
			item = itemDejado
			#cambiar imagen del item nuevo!!
			print(pj.inv_slot)
		
