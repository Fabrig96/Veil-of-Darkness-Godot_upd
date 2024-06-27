extends Area2D

const SPEED = 500
var angle = 0.0
#var angle 
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()  # Asegúrate de inicializar el generador de números aleatorios
	#angle = randf_range(PI / 2, 3 * PI / 2)  # Genera un ángulo aleatorio entre π/2 y 3π/2
	angle = randf_range(3 * PI / 4, 5 * PI / 4)  # Genera un ángulo aleatorio entre 3π/4 y 5π/4
	print("ÁNGULO ELEGIDO = ", angle)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement = calculate_movement(delta, angle)
	global_position += movement

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func _on_body_entered(body):
	if body is Player:
		if GLOBAL.ultimate < 100:
			GLOBAL.ultimate += 25
			$CollectSound.play()
			print("Valor Ultimate: ",GLOBAL.ultimate)
			$Sprite2D.visible = false
			$CollisionShape2D.set_deferred("disabled",true)
		
		#queue_free()

func calculate_movement(delta, new_angle):
	var direction = Vector2()
	direction.x = cos(new_angle) * SPEED * delta
	direction.y = sin(new_angle) * SPEED * delta
	return direction


func _on_body_exited(body):
	if body is Player:
		if GLOBAL.ultimate == 100:
			$UltimateReady.play()
			
