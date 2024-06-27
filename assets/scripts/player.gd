extends CharacterBody2D
class_name Player

@onready var screensize = get_viewport_rect().size
@export var spellAtack : PackedScene
@export var ultimate : PackedScene
@export var spellShield : PackedScene
var readyAtack = true
var isShield = false
var isTurbo = false
const SPEED = 290 #antes 280
const SPEEDTURBO = SPEED*2

func _process(_delta):
	pass
	
func _physics_process(_delta):
	if verifyTargetPoints() and not verifyTimeLimit():
		anim_control()
		motion_control()
		anim_Atack()
		anim_defense()
	
func _input(event):
	if event.is_action_pressed("atacar"):
		atack_control()
	if !isShield:
		if event.is_action_pressed("defensa"):
			defense_control()
	if event.is_action_pressed("turbospeed"):
		turbo_control()
	
func anim_Atack():
	if Input.is_action_pressed("atacar"):
		$darkmagician.play("atack")

func anim_defense():
	if Input.is_action_pressed("defensa"):
		$darkmagician.play("defense")

func anim_control():
	if GLOBAL.get_axis().y > 0:
		$darkmagician.animation = "updown"
	elif GLOBAL.get_axis().y < 0:
		$darkmagician.animation = "updown"
	elif GLOBAL.get_axis().x < 0:
		$darkmagician.animation = "fly"
	elif GLOBAL.get_axis().x > 0:
		$darkmagician.animation = "fly"
	elif GLOBAL.get_axis().x == 0:
		$darkmagician.animation = "idle"
	
		
func motion_control():
	if not isTurbo:
		velocity.x = GLOBAL.get_axis().x * SPEED
		velocity.y = GLOBAL.get_axis().y * -SPEED
	else:
		velocity.x = GLOBAL.get_axis().x * SPEEDTURBO
		velocity.y = GLOBAL.get_axis().y * -SPEEDTURBO	
	move_and_slide()
	position.x = clamp(position.x,0,screensize.x)
	position.y = clamp(position.y,0,screensize.y)

func atack_control():
	if readyAtack and GLOBAL.life == 1:
		if GLOBAL.ultimate < 100:
			$spell.play("spell")
			$Location/AudioSpell.play()
			var spellAtack_instance = spellAtack.instantiate()
			spellAtack_instance.global_position = $Location/SpellSpawn.global_position
			get_tree().call_group("Level","add_child",spellAtack_instance)
			readyAtack = false
		else:
			#$spell.play("spell")
			$ultimate.play("ultim")
			$ultimate/CryUltimate.play()
			$Location/AudioUltimate.play()
			var ultimate_instance = ultimate.instantiate()
			ultimate_instance.global_position = $Location/UltimateSpawn.global_position
			get_tree().call_group("Level","add_child",ultimate_instance)
			GLOBAL.ultimate = 0
			
			readyAtack = false
			
func _on_tiempo_disparo_timeout():
	if (!readyAtack):
		readyAtack = true


func defense_control():
	if not isShield and GLOBAL.contadorParaShield == 2 and not GLOBAL.shield:
		
		$Location/AudioShield.play()
		$TiempoShield.start()
		var spellShield_instance = spellShield.instantiate()
		
		#get_tree().call_group("Level","add_child",spellShield_instance)
		add_child(spellShield_instance)
		spellShield_instance.global_position = $Location/ShieldSpawn.global_position
		isShield = true
		GLOBAL.shield = true
		print("SHIELD = ",GLOBAL.shield)
		GLOBAL.contadorParaShield  = 0
	
func particlesUpDown():
	if verifyTargetPoints() and not verifyTimeLimit():
		if GLOBAL.get_axis().y > 0 or GLOBAL.get_axis().y < 0:
			GLOBAL.createParticle("particleUD",$particleSpawnUD.global_position)
		
func _on_tiempo_particulas_timeout():
	particlesUpDown()

func destroyed():
	$darkmagician.visible = false
	print("PLAYER DESTRUIDO")
	GLOBAL.life = 0
	print("Vida: ",GLOBAL.life)

func verifyTargetPoints():
	return GLOBAL.points < GLOBAL.targetpointslv1

func verifyTimeLimit():
	return GLOBAL.tiempoLimite
	


func _on_tiempo_shield_timeout():
	isShield = false
	GLOBAL.shield = false
	print("SHIELD FUERA")

func turbo_control():
	if GLOBAL.usoTurbo == 0:
		isTurbo = true
		$TurboSound.play()
		$TiempoTurbo.start()
		GLOBAL.usoTurbo += 1
		GLOBAL.isTurbo = true
		
func _on_tiempo_turbo_timeout():
	isTurbo = false
	GLOBAL.isTurbo = false
