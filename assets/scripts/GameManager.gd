extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func game_over():
	# Cambia a la escena de "Game Over"
	if GLOBAL.life == 0 or GLOBAL.tiempoLimite == true:
		GLOBAL.contadorParaShield = 0
		GLOBAL.isTurbo = false
		GLOBAL.usoTurbo = 0
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://scenes/gameover.tscn")
	
	#if GLOBAL.tiempoLimite == true:
		#await get_tree().create_timer(3).timeout
		#get_tree().change_scene_to_file("res://scenes/gameover.tscn")
	
func level_completed():
	if GLOBAL.points == GLOBAL.targetpointslv1 and not GLOBAL.tiempoLimite:
		GLOBAL.contadorParaShield = 0
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://scenes/levelcompleted.tscn")
		GLOBAL.level = 2
