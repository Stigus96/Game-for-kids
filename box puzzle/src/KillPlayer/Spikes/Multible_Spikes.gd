extends Area2D

var numberOfSpikes
#Removed all the spikes
func remove_spikes() -> void:
	numberOfSpikes = self.findNumberOfChildren()
	
	#Goes through all the spikes and hides them
	for x in range(numberOfSpikes):
		get_child(x).hideSpike()
		pass
	
	pass

#Shows all the spikes
func show_spikes() -> void:
	numberOfSpikes = self.findNumberOfChildren()
	
	#Goes through all the spikes and shows them
	for x in range(numberOfSpikes):
		get_child(x).showSpike()
		
		pass

func findNumberOfChildren() -> int:
	var amount = get_child_count()
	return amount
