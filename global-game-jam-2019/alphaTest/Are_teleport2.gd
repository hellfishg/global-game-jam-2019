extends Area2D

 #TELEPORTER 2

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass



func _on_Are_teleport_body_entered(body):
	if body.is_in_group("player"):

		print(get_node("/root/globlal").inv_puntero)

		var packed_scene = PackedScene.new()
		packed_scene.pack(get_tree().get_current_scene())
		get_tree().change_scene("res://alphaTest/my_sceneSave.tscn")
