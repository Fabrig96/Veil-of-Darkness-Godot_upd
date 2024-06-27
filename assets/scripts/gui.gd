extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/TurboActivated.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not isArcadeLevel():
		$HUD/Level.text = "Level "+str(GLOBAL.level)
	else:
		$HUD/Level.text = "Level Arcade"
	
	$HUD/Points.text = "POINTS: "+ str(GLOBAL.points)
	
	if not isArcadeLevel():
		$HUD/Target.text = "Target: "+ str(GLOBAL.targetpointslv1)
		$HUD/LabelTiempo.text = "Time Left: "+str(GLOBAL.tiempoRestante) +" sec"
	else:
		$HUD/Target.visible = false
		$HUD/LabelTiempo.visible = false
	
	$HUD/Ultimate.text = "ULTIMATE "+str(GLOBAL.ultimate)+" %"
	
	if GLOBAL.ultimate == 100:
		$HUD/UltimateReady.visible = true
	else:
		$HUD/UltimateReady.visible = false
	
	if GLOBAL.tiempoLimite:
		$HUD/TiempoFuera.visible = true
	else:
		$HUD/TiempoFuera.visible = false
	
	if GLOBAL.contadorParaShield == 2 and not GLOBAL.shield:
		$HUD/ShieldReady.visible = true
	else:
		$HUD/ShieldReady.visible = false
	
	if GLOBAL.isTurbo:
		$HUD/TurboActivated.visible = true
		
	else:
		$HUD/TurboActivated.visible = false
		

func isArcadeLevel():
	return GLOBAL.isArcade


