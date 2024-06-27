extends RichTextLabel

var t1 = "'Finalmente, el mundo está cayendo bajo mi dominio.
 Mi poder crece con cada día que pasa, y los débiles se doblegan ante mi magia oscura. Ningún mortal puede desafiarme. Mi ejército de magos ha asegurado cada rincón de esta tierra devastada por la guerra mágica. 
Pero... he oído rumores de una ofensiva. Los humanos, desesperados y valientes, han lanzado una última resistencia aérea. Creen que sus máquinas voladoras pueden detenerme. ¡Insensatos! No permitiré que su insolencia interrumpa mi reinado.'"
# Called when the node enters the scene tree for the first time.

var t2 = "'Debo destruir sus fuerzas aéreas personalmente. Les mostraré el verdadero poder de la magia. Ningún avión, ningún misil, podrá detenerme. 
...Mis fieles seguidores, mantengan sus posiciones. Yo me encargaré de esta amenaza. Cuando regrese, no quedará nada de su ofensiva. Que los cielos ardan con su desesperación y que sus esperanzas se desvanezcan como cenizas al viento. Esta es la era de Atramentus, y ningún humano cambiará ese destino.'"


func _ready():
	GLOBAL.scene = 1
	
	
func _process(_delta):
	#print("ESCENA DESDE TEXT: ",GLOBAL.scene)
	if GLOBAL.scene == 1:
		text = t1
	elif GLOBAL.scene == 2:
		text = t2
	elif GLOBAL.scene == 3:
		text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func scroll_text(input_text):
	#visible_characters = 0
	#text = input_text
	#for i in text.length():
		#visible_characters +=1
		#await get_tree().create_timer(0.02).timeout
	
