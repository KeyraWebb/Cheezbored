extends Control

@export var speaker_label: Label
@export var dialogue_label: Label 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _create_dialogue(speaker: String, dialogue: String) -> void:
	
	#check if there's a speaker to display, else hide speaker text
	if speaker == "":
		speaker_label.visible = false
	else:
		speaker_label.text = speaker
		speaker_label.visible = true
	
	#change dialogue text
	dialogue_label.text = dialogue
	
	self.visible = true
	
func _hide_dialogue() -> void:
	self.visible = false
	
