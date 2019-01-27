extends Area2D

var item = "llave"
var tocado = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	pass
	

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		tocado = true
		body.inv_slot[body.inv_puntero] = item
		print(body.inv_slot)
		print("tocado")


func _on_Area2D_body_exited(body):
	tocado = false
	print("no_tocado")


func _on_kin_Pj_accion():
	if tocado:
		$spr_item.animation = "abierto"
