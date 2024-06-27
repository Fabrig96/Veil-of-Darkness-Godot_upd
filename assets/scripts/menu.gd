extends Control

var vol : HSlider
# Called when the node enters the scene tree for the first time.
func _ready():
	GLOBAL.life = 1
	GLOBAL.points = 0
	GLOBAL.ultimate = 0
	$mainMenu.play()
	vol = $Volume
	vol.value = GLOBAL.volumeValue

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
	print("Game init Levels")
	get_tree().change_scene_to_file("res://scenes/menuLevels.tscn")


func _on_check_box_toggled(_toggled_on):
	print(DisplayServer.window_get_mode())
	
	if DisplayServer.window_get_mode() == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
	elif DisplayServer.window_get_mode() == 3:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	

func _on_tutorial_pressed():
	$buttonsound.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")



# Función para ajustar el volumen general
func set_volume(volume):
	# Asegúrate de que el volumen esté entre 0 y 1
	volume = clamp(volume, 0, 1)
	
	# Convierte el volumen a decibelios
	var db_volume = linear2db(volume)
	
	# Ajusta el volumen del bus maestro
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), db_volume)

# Función de utilidad para convertir un valor lineal (0 a 1) a decibelios
func linear2db(value):
	if value == 0:
		return -80  # Silencio total
	return 20 * log(value) /log(10)


func _on_volume_value_changed(value):
	GLOBAL.volumeValue = value
	for v in range(0,101):
		if value == v:
			var vf:float = v
			set_volume(vf/100)
			


func _on_music_on_of_toggled(_toggled_on):
	if GLOBAL.musicOn:
		GLOBAL.musicOn = false
		$mainMenu.stop()
	else:
		GLOBAL.musicOn = true
		$mainMenu.play()


func _on_creditos_pressed():
	$buttonsound.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/credits.tscn")



func _on_arcade_pressed():
	$buttonsound.play()
	await get_tree().create_timer(1).timeout
	print("Game init arcade")
	get_tree().change_scene_to_file("res://scenes/menuArcade.tscn")


func _on_niveles_pressed():
	$buttonsound.play()
	await get_tree().create_timer(1).timeout
	print("Game init Levels")
	get_tree().change_scene_to_file("res://scenes/menuLevels.tscn")

