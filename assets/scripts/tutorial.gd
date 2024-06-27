extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if GLOBAL.musicOn:
		$mainMenu.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_vercontroles_pressed():
	$buttonsound.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/controles.tscn")


func _on_atras_pressed():
	$buttonsound.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	GLOBAL.musicOn = true
	#print("GLOBAL MUSIC ESTA EN : ",GLOBAL.musicOn)
