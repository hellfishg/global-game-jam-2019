extends Area2D

export(String) var item
var tocado = false
export (bool) var vivo
var pj

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
	print("no_tocado")

func _on_Kin_Pj_accion():
	if tocado && vivo:
		#pasan 3: esp, no esp, botella, botella sin esp
		var lleno = true
		
		#tiene espacio:
		for i in range(4):
			if pj.inv_slot[i] == "vacio":
				pj.inv_slot[i] = item
				vivo = false
				lleno = false
				break
		
		#no tiene espacio y es botella:
		if item == "botella" && lleno:
			#toma alcohol
			print("toma alcohol!!")
			vivo = false
			lleno = false
			
		if item == "agua":
			if pj.alcoholEnSangre > 0:
				print("toma agua")
				pj.alcoholEnSangre -= 1
				vivo = false
				lleno = false
			
		
		print(pj.inv_slot)
		
