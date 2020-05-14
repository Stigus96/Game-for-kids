# DialogBox.gd
extends RichTextLabel

var dialog = ["Welcome to Puzzle Box!\nWe are very excited to have you here! Before we begin our journey, let's start of with some basic instructions...\nPress Enter to continue...",
 "For your character to move, press 'A' and 'D' to go left and right and 'W' to jump.\nYou can also use the SPACE bar to jump...\nPress Enter to continue...",
"As you can see, there is a box in front of you. \nTry pushing it! \nPress Enter to continue...",
"Down the pit there is a pressure plate, can you find a way to trigger it without jumping down yourself? \nPress Enter to continue...",
"Pick up the coin to add points to the counter in the top right corner \nPress Enter to continue...",
"Be aware of the spikes! \n When you are ready, go through the portal to get to the next level!" ]
var page = 0

# Dialog box starts showing text when scene starts. Will show 1 letter at a time 
func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)

# If action is pressed the whole text will show and you will be able to press it again
# for the next page to start rolling
func _input(event):
	if Input.is_action_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size() - 1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())

#Each time a timeout is called, a new character is visible
func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
