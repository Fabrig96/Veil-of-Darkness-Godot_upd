extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not GLOBAL.shield:
		queue_free()


func _on_area_entered(area):
	if area.is_in_group("Misil"):
		$ImpactMisilShield.play()
		area.queue_free()



