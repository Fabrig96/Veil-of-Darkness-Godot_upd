extends CPUParticles2D

# Define la señal particle_finished para evitar conflictos
signal particle_finished

# Llama a esta función cuando la partícula deba terminar
func _ready():
	# Añadir un Timer manualmente al nodo de partículas
	var timer = Timer.new()
	timer.wait_time = 1.0  # Duración de la partícula (1 segundo, ajustar según necesidad)
	timer.one_shot = true
	add_child(timer)
	timer.particle_finished(self,_on_timeout)
	timer.start()

# Emite la señal particle_finished cuando el temporizador termine
func _on_timeout():
	emit_signal("particle_finished")
	queue_free()
