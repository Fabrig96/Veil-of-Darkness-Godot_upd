extends RichTextLabel

var t1 = "'Fllflsflfwfwfwf'"
# Called when the node enters the scene tree for the first time.
func _ready():
	scroll_text(t1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func scroll_text(input_text):
	visible_characters = 0
	text = input_text
	for i in text.length():
		visible_characters +=1
		await get_tree().create_timer(0.02).timeout
	
