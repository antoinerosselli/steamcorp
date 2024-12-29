extends Control

@onready var titre = $Fond/Titre
@onready var dial = $Fond/Texte
@onready var menu_button = $Fond/MenuButton

@onready var id = 0
@onready var dialogues
@onready var path4answers = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func set_up(ntitle, npop_up_id):
	titre.text = ntitle
	dialogues = parse_text(npop_up_id)
	author(dialogues,id)

func author(dialogues, id):
	print(dialogues)
	parse_dialogue(dialogues[id])

func parse_dialogue(content):
	var pop_up = menu_button.get_popup()
	
	var key = content.keys()[0] 
	var dialogue_text = key.split("] ", 2)[1] 
	dial.text = dialogue_text
	var answers = content[key].keys()
	var tmpp4a = {}
	for answer in answers:
		var path = content[key].get(answer)
		var clean_answer = answer.split(")", 2)[1]
		tmpp4a = {clean_answer:path}
		path4answers.merge(tmpp4a)
		pop_up.add_item(clean_answer)


func parse_text(file_path):
	var file = FileAccess.open(file_path, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	var lines = content.split("\n")
	
	var asks = []
	var ask:String
	var all_responses_to_ask = {}
	var responses = []
	var paths = []
	
	for line in lines :
		line = line.strip_edges()
		if line.begins_with("["):
			ask = line.get_slice("[]", 1)
		elif line.begins_with("("):
			var parts = line.split("=>")
			responses.append(parts[0].get_slice("()", 1))
			paths.append(parts[1].strip_edges())
		elif line.begins_with("*"):
			all_responses_to_ask = {ask:link_responses_paths(responses, paths)}
			asks.append(all_responses_to_ask)
			responses.clear()
			paths.clear()

	return asks

func link_responses_paths(responses, paths):
	var linked_dict = {}
	for i in range(responses.size()):
		linked_dict[responses[i]] = paths[i]
	
	return linked_dict

func _process(_delta):
	pass

func _on_close_pressed():
	id = 0
	queue_free()

func _on_menu_button_item_selected(index):
	var answer = menu_button.get_item_text(index)
	if path4answers[answer][1] == "E":
		queue_free()
	else :
		var path = path4answers[answer][1].to_int()
		menu_button.clear()
		author(dialogues,path)
