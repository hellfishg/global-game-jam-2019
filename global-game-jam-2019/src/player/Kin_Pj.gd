extends KinematicBody2D

var speed = 350
var jump_speed = 900
var gravity = 1300

#var text_actual = null

var distance = Vector2()
var velocity = Vector2()
var direction = Vector2()

signal accion

var inv_puntero = 0
var inv_slot = ["vacio", "vacio","vacio","vacio"]
var alcoholEnSangre = 0

func _ready():
	inv_puntero = get_node("/root/Global").inv_puntero
	inv_slot = get_node("/root/Global").inv_slot
	alcoholEnSangre = get_node("/root/Global").alcoholEnSangre
	MenuPos()
	
	set_physics_process(true)
	set_process(true)
	
func _physics_process(delta):
	_move(delta)

func _move(delta):
	direction.x = int(Input.is_action_pressed("joy_der"))-int(Input.is_action_pressed("joy_izq"))
	
	if direction.y != 0:
		$spr_Pj.animation = "salto"
	
	if direction.x != 0 and direction.y == 0:
		$spr_Pj.animation = "mover"
		$spr_Pj.playing = true
		
	elif direction.x == 0 and direction.y == 0:
		$spr_Pj.playing = false
		$spr_Pj.animation = "frente"
	
	if direction.x > 0:
		$spr_Pj.flip_h = false
	elif direction.x < 0:
		$spr_Pj.flip_h = true
	
	distance.x = speed*delta
	velocity.x = (direction.x*distance.x)/delta
	velocity.y += gravity*delta
	
	move_and_slide(velocity,Vector2(0,-1))
	
	var get_col = get_slide_collision(get_slide_count()-1)
	
	#determina cuando toca el piso?
	if is_on_floor():
		velocity.y = 0
		direction.y = 0

		if Input.is_action_just_pressed("joy_salto"):
			velocity.y = -jump_speed
			direction.y = 1
	
	#Determina la colision con objetos fisico. y corta la velocidad de salto.
	if get_col != null:
		if get_col.normal == Vector2(0,1):
			velocity.y = 0
	
	################################
	
	if Input.is_action_just_pressed("joy_seleccion"):
		if inv_slot[inv_puntero] == "botella":
			inv_slot[inv_puntero] = "vacio"
			tomarAlcohol()

	if Input.is_action_just_pressed("joy_accion"):
		emit_signal("accion")
		
	if Input.is_action_just_pressed("joy_inv_der"):
		if inv_puntero < 3:
			inv_puntero += 1
		else:
			inv_puntero = 0
		#get_node("../../Node2/HUD/AnimatedSprite").animation = str(inv_puntero)
		$Barras/CanvasLayer/indice.animation = str(inv_puntero)

	if Input.is_action_just_pressed("joy_inv_izq"):
		if inv_puntero > 0:
			inv_puntero -= 1
		else:
			inv_puntero = 3
		#get_node("../../Node2/HUD/AnimatedSprite").animation = str(inv_puntero)
		$Barras/CanvasLayer/indice.animation = str(inv_puntero)
	if Input.is_action_just_pressed("joy_seleccion"):
		pass

	#chequea si la colicion es un "items" y actua en consecuencia.
	if get_col != null:
		if get_col.collider.is_in_group("items"):
			var item = get_col.collider.item
			
			if item == "agua":
				if alcoholEnSangre > 0:
					alcoholEnSangre -= 1
					get_col.collider.queue_free()
			
			if item == "botella":
				var lleno = true
				get_col.collider.queue_free()
				
				for i in range(4):
					if inv_slot[i] == "vacio":
						inv_slot[i] = item
						lleno = false
						break
				
				if lleno:
					#tomar alcohol
					tomarAlcohol()
					
					
				print(inv_slot)

	actualizar_menu()
	actualizar_vida()
						
func actualizar_vida():
	if alcoholEnSangre == 6:
		get_tree().change_scene("res://level_0/Game_Over.tscn")
						
func actualizar_menu():
	$Barras/CanvasLayer/item1.animation = inv_slot[0]
	$Barras/CanvasLayer/item2.animation = inv_slot[1]
	$Barras/CanvasLayer/item3.animation = inv_slot[2]
	$Barras/CanvasLayer/item4.animation = inv_slot[3]
	$Barras/CanvasLayer/BarraVomito.animation = str(alcoholEnSangre)
			
func MenuPos():
	var posAct = Vector2()
	posAct.x = 0
	posAct.y = 670
	
	$Barras/CanvasLayer/indice.position += posAct
	$Barras/CanvasLayer/item1.position += posAct
	$Barras/CanvasLayer/item2.position += posAct
	$Barras/CanvasLayer/item3.position += posAct
	$Barras/CanvasLayer/item4.position += posAct
	
	posAct = Vector2()
	posAct.x = 1265
	posAct.y = 300
	
	$Barras/CanvasLayer/BarraVomito.position += posAct
	
func tomarAlcohol():
	alcoholEnSangre += 1
	print("tomar!!")
	


###################################

##salida al nivel 2:
#func _on_exit_body_entered(body):
#	get_tree().change_scene("res://nivel2/Level_2.tscn")
	





