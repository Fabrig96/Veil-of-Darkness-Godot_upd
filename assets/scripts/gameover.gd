extends Control

var maximaPuntacion = 0
var recordPointsSave
# Called when the node enters the scene tree for the first time.
func _ready():
	print("FUE ARCADE: ",GLOBAL.isArcade)
	if GLOBAL.musicOn:
		$AudioGameOver.play()
	if not GLOBAL.isArcade:
		if GLOBAL.tiempoLimite and GLOBAL.life == 1:
			$MotivoGameOver.text = "Se acabó el tiempo!"
		else:
			$MotivoGameOver.text = "Te han destruido!"
			
		$Puntuacion.visible = false
		$Record.visible = false
		
	elif GLOBAL.life == 0:
		$MotivoGameOver.text = "Que poco has durado!"
		$Puntuacion.text = "Puntuacion: "+str(GLOBAL.points)
		GLOBAL.load_game()
		recordPointsSave = GLOBAL.game_data["recordPoints"]
		if GLOBAL.points > recordPointsSave:
			GLOBAL.game_data["recordPoints"] = GLOBAL.points
			GLOBAL.save_game()
		
		GLOBAL.load_game()
		$Record.text = "Puntuacion Record historica: "+str(GLOBAL.game_data["recordPoints"])
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
	if GLOBAL.isArcade:
		get_tree().change_scene_to_file("res://scenes/level_arcade.tscn")
	else:
		if GLOBAL.level == 1:
			get_tree().change_scene_to_file("res://scenes/level.tscn")
		elif GLOBAL.level == 2:
			get_tree().change_scene_to_file("res://scenes/level_n2.tscn")
		elif GLOBAL.level == 3:
			get_tree().change_scene_to_file("res://scenes/level_n3.tscn")
		
	GLOBAL.life = 1
	GLOBAL.points = 0
	GLOBAL.ultimate = 0
	GLOBAL.contadorParaShield = 0
	GLOBAL.usoTurbo = 0
	GLOBAL.shield = false
	GLOBAL.isTurbo = false
func _on_tutorial_pressed():
	$buttonsound.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
