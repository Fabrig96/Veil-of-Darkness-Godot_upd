extends Node2D

@export var enemy:PackedScene
@onready var game_manager = get_node("GameManager")
@onready var pause_label = $PausedGUI/PauseLabel
var timeLeft: int
# Called when the node enters the scene tree for the first time.

func _ready():
	GLOBAL.level = 2
	GLOBAL.targetpointslv1 = GLOBAL.targetpointslv2Value
	print("*** NIVEL: ",GLOBAL.level," ***")
	if GLOBAL.musicOn:
		$control/trackBG.play()
	GLOBAL.tiempoLimite = false
	GLOBAL.shield = false
	pause_label.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	parallax_bg(delta)
	$PathSpawn/PathFollow2D.progress_ratio = randf()
	game_manager.game_over()
	game_manager.level_completed()
	if pause_label.visible:
		pause_label.visible = false

	timeLeft = $GameManager/TiempoLimite.time_left
	GLOBAL.tiempoRestante = timeLeft
	#print("TIEMPO : ",progress)
	
	
func parallax_bg(delta_time):
	$background/Back.scroll_base_offset -=Vector2(1,0) * 100 * delta_time
	$background/clouds1.scroll_base_offset -=Vector2(1,0) * 400 * delta_time
	$background/clouds2.scroll_base_offset -=Vector2(1,0) * 400 * delta_time
	$background/clouds3.scroll_base_offset -=Vector2(1,0) * 460 * delta_time
	$background/clouds4.scroll_base_offset -=Vector2(1,0) * 460 * delta_time
	$background/stars.scroll_base_offset -=Vector2(1,0) * 100 * delta_time


func _on_tiempo_spawn_timeout():
	var enemy_instance = enemy.instantiate()
	enemy_instance.global_position = $PathSpawn/PathFollow2D.global_position	
	
	var tx1 = "res://assets/images/enemy planes/planes_n2/plane_n2.png"
	var tx2 = "res://assets/images/enemy planes/planes_n2/plane2_n2.png"
	var tx3 = "res://assets/images/enemy planes/planes_n2/plane3_n2.png"
	var tx4 = "res://assets/images/enemy planes/planes_n2/plane4_n2.png"

	var array = [tx1,tx2,tx3,tx4]
	var texture = array[randi_range(0,3)]
	enemy_instance.set_sprite(texture)
	add_child(enemy_instance)
	

func _input(_event):
	if Input.is_action_just_pressed("pause_game"):
		pause_game()
		
	if Input.is_action_just_pressed("salir"):
		print("JUEGO CERRADO")
		exit()
		
func pause_game():
	pause_label.visible = true
	get_tree().paused = true



func _on_tiempo_limite_timeout():
	#GLOBAL.life = 0
	GLOBAL.tiempoLimite = true
	game_manager.game_over()
	print("SE ACABO EL TIEMPO!!!")

func exit():
	get_tree().quit()
