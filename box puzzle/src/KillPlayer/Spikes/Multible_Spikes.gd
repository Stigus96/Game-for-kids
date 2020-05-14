extends Area2D

var numberOfSpikes

func _ready():
	pass

func remove_spikes() -> void:
	numberOfSpikes = self.findNumberOfChildren()
	
	for x in range(numberOfSpikes):
		get_child(x).hideSpike()
		pass
	
	pass

func show_spikes() -> void:
	numberOfSpikes = self.findNumberOfChildren()
	
	for x in range(numberOfSpikes):
		get_child(x).showSpike()
		
		pass

func findNumberOfChildren() -> int:
	var amount = get_child_count()
	return amount
