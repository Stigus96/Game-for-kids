extends RichTextLabel


var s = 0


func _process(delta):
	
	set_text(str(s))

func _on_Timer_timeout():
	s +=1
	pass # Replace with function body.
