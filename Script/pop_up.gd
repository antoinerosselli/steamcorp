extends Control

@onready var titre = $Fond/Titre
@onready var texte = $Fond/Texte
var pop_up_id:String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func set_up(ntitle, npop_up_id):
	pop_up_id = npop_up_id
	titre.text = ntitle

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_close_pressed():
	queue_free()
