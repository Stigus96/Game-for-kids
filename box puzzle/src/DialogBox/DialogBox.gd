# DialogBox.gd
extends RichTextLabel

var dialog = ["Hello and welcome to our game aewjkhbf efawfaf we fw ef ewf aewf awef wf wfe ....guytgtygyguytgftyfuytft ftyf fty futyft ft tuf ....", "This is nice and will work perfectly"]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)

func _input(event):
	if Input.is_action_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size() - 1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
