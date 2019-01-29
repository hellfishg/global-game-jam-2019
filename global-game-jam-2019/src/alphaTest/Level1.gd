extends Node

var lleno = true
var medio = false
var vacio = false

export (PackedScene) var Mob
var score

func _ready():
	pass

func _on_TImer_Vomito_timeout():
	if (lleno):
		$HUD/Barra_vomito.animation = "medio"
		lleno = false
		medio = true
	elif (medio):
		$HUD/Barra_vomito.animation = "vacio"
		medio = false
		vacio = true
	else: 
		$HUD/Barra_vomito.animation = "lleno"
		vacio = false
		lleno = true
