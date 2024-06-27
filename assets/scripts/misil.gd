extends Area2D
@onready var player = preload("res://scenes/player.tscn").instantiate()
const SPEED = 720

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x -= SPEED * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	pass

func _on_body_entered(body):
	if body is Player:
		player.global_position = global_position
		player.destroyed()
		$PlayerDestroyed.play()
		call_deferred("add_child",player)
		body.queue_free()
		$AnimatedSprite2D.queue_free()
		
