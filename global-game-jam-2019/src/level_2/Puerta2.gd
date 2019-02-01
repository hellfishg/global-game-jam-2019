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
		pj = body
		teleport(body)

func teleport(body):
	#Si hay paso:
	salida = body.position
	salida.x = -735
	salida.y = 539
	body.position = salida

	
	#get_node("/root/Global").inv_puntero = body.inv_puntero
	get_node("/root/Global").inv_slot = body.inv_slot
	get_node("/root/Global").alcoholEnSangre = body.alcoholEnSangre
	get_node("/root/Global").level2_On = 1

	var dir = Directory.new()
	dir.remove("res://sceneSaveLevel2.tscn")

	var packed_scene = PackedScene.new()
	packed_scene.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://sceneSaveLevel2.tscn", packed_scene)
	get_tree().change_scene("res://sceneSaveLevel1.tscn")	





