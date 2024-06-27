extends Area2D

const SPEED = 500
var tipedireccion

# Called when the node enters the scene tree for the first time.
func _ready():

	randomize()  # inicializar el generador de números aleatorios
	tipedireccion = randi() % 3  # incluir todas las direcciones
	print("DIRECCION ELEGIDA = ",tipedireccion)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement = randDirection(delta, tipedireccion)
	global_position += movement

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body is Player:
		GLOBAL.ultimate += 25
		print(GLOBAL.ultimate)
		queue_free()

func randDirection(delta, tipedireccion):
	var direccion = Vector2()
	match tipedireccion:
		0: 
			direccion.x -= SPEED * delta  
			print("direccion x: ", direccion.x)
		1: 
			direccion.y += SPEED * delta  
			print("direccion y: ", direccion.y)
		2: 
			direccion.y -= SPEED * delta  
			print("direccion y: ", direccion.y)
	return direccion
