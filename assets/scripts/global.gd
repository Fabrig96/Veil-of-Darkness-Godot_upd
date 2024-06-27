extends Node

# Called when the node enters the scene tree for the first time.
var level  #NIVELES
var isArcade = false# false arcade, true por niveles
var points = 0
var life = 1  #0 -> finjugador
var shield = false
var prepareShield = false
var ultimate = 0 #hasta 100%
var targetpointslv1 = 1800 #Inicial target lv1
var targetpointslv1Value = 1800 #Aux target lv1
var targetpointslv2Value = 1800 #Aux target lv2
var targetpointslv3Value = 1800 #Aux target lv2
var targetpointsArcade = INF 
var tiempoLimite = false
var tiempoRestante:int
var contadorParaShield = 0   #max 2
var usoTurbo = 0 #max 1
var isTurbo:bool
var musicOn = true
var axis:Vector2
var particleud = preload("res://scenes/particleUD.tscn")
var volumeValue = 100
#-menu--
var isCheckScren :bool
var isMusicOn : bool
#intro
var scene: int


#save
var save_path = "user://save_game.dat"
var game_data : Dictionary ={
	"recordPoints" : 0
}

func save_game():
	var save_file = FileAccess.open(save_path,FileAccess.WRITE)
	save_file.store_var(game_data)
	save_file = null

func load_game():
	if FileAccess.file_exists(save_path):
		var save_file = FileAccess.open(save_path,FileAccess.READ)	
		game_data = save_file.get_var()
		save_file = null
		

func createParticle(vfx_name, pos):
	if life == 1:
		var selected_particle
		match vfx_name:
			"particleUD":
				selected_particle = particleud
		var new_particle = selected_particle.instantiate()
		new_particle.position = pos
		new_particle.one_shot = true
		get_tree().current_scene.add_child(new_particle)
		await get_tree().create_timer(1).timeout
		destroyParticle(new_particle)

func destroyParticle(particle):
	particle.queue_free()
			
func get_axis():
	axis.x = int(Input.is_action_pressed("derecha")) - int(Input.is_action_pressed("izquierda"))
	axis.y = int(Input.is_action_pressed("arriba")) - int(Input.is_action_pressed("abajo"))
	return axis.normalized()







