extends Node2D
class_name EnemyLv2

const SPEED = 400
@export var misil:PackedScene
@onready var player = preload("res://scenes/player.tscn").instantiate()
@export var collect = preload("res://scenes/collect.tscn")
@onready var explosion:bool = false
var destroyed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match explosion:
		false: global_position.x -= SPEED * delta
			
func explosion_control():
	explosion = true
	print("AVION DESTRUIDO")
	$Area2D.queue_free()
	$Explosion.play("explo")
	$Explosion/AudioExplosion.play()
	var collect_instant = collect.instantiate()
	call_deferred("add_child",collect_instant)
	destroyed = true
	
	if GLOBAL.shield == false:
		if GLOBAL.contadorParaShield < 2:
			GLOBAL.contadorParaShield +=1
		else:
			GLOBAL.contadorParaShield = 2
	else:
		GLOBAL.contadorParaShield = 0
	print("SE INCREMENTO EL SHIELD: ",GLOBAL.contadorParaShield)
	
func _on_area_2d_area_entered(area):
	if area.is_in_group("Spell") or area.is_in_group("Ultimate"):
		explosion_control()
		GLOBAL.points+=100
		print("Puntos: ",GLOBAL.points)

func _on_area_2d_body_entered(body):
	if body is Player:
		explosion_control()
		player.destroyed()
		$Explosion/AudioDetroyPlayer.play()
		call_deferred("add_child",player)
		body.queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	if GLOBAL.contadorParaShield > 0:
		GLOBAL.contadorParaShield -= 1
	print("SE DESCONTO EL SHIELD: ",GLOBAL.contadorParaShield)
	queue_free()


func _on_audio_explosion_finished():
	queue_free()

func shoot():
	if GLOBAL.points != GLOBAL.targetpointslv1:
		if position.x>64:
			var misil_instance = misil.instantiate()
			misil_instance.global_position = $SpawnMisil.global_position
			get_tree().call_group("Level","add_child",misil_instance)
			$AudioShootMisil.play()

func _on_tiempo_disparo_timeout():
	if not destroyed:
		shoot()
		
		
func set_sprite(name):
	$Area2D/Sprite2D.texture = load(name)
