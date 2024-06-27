extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	GLOBAL.scene = 1
	$sceneSprite1/AnimationPlayer.play("show")
	$sceneSprite2.visible = false
	$sceneSprite3.visible = false
	$Change.visible = false
	$Labelbtn.visible = false
	$introvoice1.play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_change_pressed():
	if GLOBAL.scene == 1:
		$sceneSprite1.visible = false
		$introvoice1.stop()
		$sceneSprite2.visible = true
		$sceneSprite2/AnimationPlayer.play("show")
		$introvoice2.play()
		GLOBAL.scene += 1
		#print(GLOBAL.scene)
	elif GLOBAL.scene == 2:
		$sceneSprite2.visible = false
		$introvoice2.stop()
		$sceneSprite3.visible = true
		$sceneSprite3/AnimationPlayer.play("show")
		$finalsound.play()
		GLOBAL.scene += 1
		#print(GLOBAL.scene)
	elif GLOBAL.scene == 3:
		#print(GLOBAL.scene)
		print("ENTRANDO AL JUEGO")
		$sceneSprite3.visible = false
		
		get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_visible_btn_timeout():
	$Change.visible = true
	$Labelbtn.visible = true
