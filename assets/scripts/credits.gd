extends Control

func _ready():
	# Inicializar créditos
	$VBoxContainer.get_child(0).text = "Veil of Darkness"
	$VBoxContainer.get_child(1).text = "Desarrollado por Fabrizio Aguilar"
	$VBoxContainer.get_child(2).text = "© 2024 Fabrizio Aguilar. Todos los derechos reservados."
	#$VBoxContainer.get_child(3).text = "Música:\n- Artista 1\n- Artista 2"
	#$VBoxContainer.get_child(4).text = "Arte:\n- Artista 1\n- Artista 2"
	#$VBoxContainer.get_child(5).text = "Contribuciones Adicionales:\n- Contribuyente 1\n- Contribuyente 2"
	#$VBoxContainer.get_child(6).text = "© 2024 Fabrizio Aguilar. Todos los derechos reservados."

	# Configura el desplazamiento automático de los créditos
	start_credits_scroll()

func start_credits_scroll():
	# Configura la posición inicial fuera de la pantalla
	$VBoxContainer.position.y = size.y
	print(size.y)
	# Duración basada en la altura del VBoxContainer
	var duration = 10.0
	var target_y = -$VBoxContainer.size.y
	print(-$VBoxContainer.size.y)
	var tween = create_tween()
	
	tween.tween_property($VBoxContainer, "position:y", target_y, duration)
	tween.finished.connect(self._on_tween_finished)

func _on_tween_finished():
	# Reiniciar el desplazamiento de los créditos
	start_credits_scroll()


func _on_atras_pressed():
	
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
