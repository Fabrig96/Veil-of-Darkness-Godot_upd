extends Area2D

const SPEED = 230
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x += SPEED*delta
	ultimate_expand_anim()
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	

func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		area.queue_free()
		

func ultimate_expand_anim():
	var _rotatiton_speed = 10.0
	var ultis = [$ultimateExpand/expandUltimate,$ultimateExpand/expandUltimate2,$ultimateExpand/expandUltimate3,
	$ultimateExpand/expandUltimate4,$ultimateExpand/expandUltimate5,$ultimateExpand/expandUltimate6,$ultimateExpand/expandUltimate7,
	$ultimateExpand/expandUltimate8,$ultimateExpand/expandUltimate9,$ultimateExpand/expandUltimate10,$ultimateExpand/expandUltimate11,
	$ultimateExpand/expandUltimate12,$ultimateExpand/expandUltimate13,$ultimateExpand/expandUltimate14,$ultimateExpand/expandUltimate15,
	$ultimateExpand/expandUltimate16,$ultimateExpand/expandUltimate17,$ultimateExpand/expandUltimate18,$ultimateExpand/expandUltimate19,
	$ultimateExpand/expandUltimate20,$ultimateExpand/expandUltimate21,$ultimateExpand/expandUltimate22,$ultimateExpand/expandUltimate23,
	$ultimateExpand/expandUltimate24,$ultimateExpand/expandUltimate25,$ultimateExpand/expandUltimate26,$ultimateExpand/expandUltimate27,
	$ultimateExpand/expandUltimate28,$ultimateExpand/expandUltimate29,$ultimateExpand/expandUltimate30,$ultimateExpand/expandUltimate31,
	$ultimateExpand/expandUltimate32,$ultimateExpand/expandUltimate33,$ultimateExpand/expandUltimate34,$ultimateExpand/expandUltimate35,
	$ultimateExpand/expandUltimate36,$ultimateExpand/expandUltimate37,$ultimateExpand/expandUltimate38,$ultimateExpand/expandUltimate39,
	$ultimateExpand/expandUltimate40,$ultimateExpand/expandUltimate41,$ultimateExpand/expandUltimate42,$ultimateExpand/expandUltimate43,
	$ultimateExpand/expandUltimate44,$ultimateExpand/expandUltimate45]
	for ult in ultis:
		ult.rotate(.5)
		ult.play()
