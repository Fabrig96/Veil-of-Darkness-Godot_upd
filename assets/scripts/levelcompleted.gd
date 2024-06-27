extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if GLOBAL.musicOn:
		$AudioLevelWin.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_salir_pressed():
	$buttonsound.play()
	await get_tree().create_timer(1).timeout
	get_tree().quit()


func _on_iniciar_pressed():
	$buttonsound.play()
	await get_tree().create_timer(1).timeout
	print("Game init")
	GLOBAL.life = 1
	GLOBAL.points = 0
	GLOBAL.ultimate = 0
	GLOBAL.contadorParaShield = 0
	GLOBAL.usoTurbo = 0
	GLOBAL.isTurbo = false
	if GLOBAL.level == 1:
		get_tree().change_scene_to_file("res://scenes/level.tscn")
	elif GLOBAL.level == 2:
		get_tree().change_scene_to_file("res://scenes/level_n2.tscn")  
		#get_tree().change_scene_to_file("res://scenes/credits.tscn")
	elif GLOBAL.level == 3:
		get_tree().change_scene_to_file("res://scenes/level_n3.tscn") 
	elif GLOBAL.level == 4:
		get_tree().change_scene_to_file("res://scenes/credits.tscn")

func _on_tutorial_pressed():
	$buttonsound.play()
	await get_tree().create_timer(1).timeout
	GLOBAL.life = 1
	GLOBAL.points = 0
	GLOBAL.ultimate = 0
	GLOBAL.contadorParaShield = 0
	GLOBAL.usoTurbo = 0
	GLOBAL.isTurbo = false
	
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")


func _on_reiniciarlevel_pressed():
	$buttonsound.play()
	await get_tree().create_timer(1).timeout
	print("Game init")
	GLOBAL.life = 1
	GLOBAL.points = 0
	GLOBAL.ultimate = 0
	GLOBAL.contadorParaShield = 0
	GLOBAL.usoTurbo = 0
	GLOBAL.isTurbo = false
	if GLOBAL.level == 2:
		get_tree().change_scene_to_file("res://scenes/level.tscn")
	elif GLOBAL.level == 3:
		get_tree().change_scene_to_file("res://scenes/level_n2.tscn")
	elif GLOBAL.level == 4:
		get_tree().change_scene_to_file("res://scenes/level_n3.tscn") 
