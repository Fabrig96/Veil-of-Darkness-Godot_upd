extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VideoOpen.visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_timeout():
	$VideoOpen.visible = true
	$VideoOpen.play()
	$InitgameTimer.start()

func _on_initgame_timer_timeout():
	#get_tree().change_scene_to_file("res://scenes/menu.tscn")
	get_tree().change_scene_to_file("res://scenes/intro.tscn")
