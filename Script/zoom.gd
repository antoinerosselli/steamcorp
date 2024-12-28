extends Control

@onready var title = $Panel/Label
@onready var texture_rect = $Panel/TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func set_up(ntitle, ntexture):
	title.text = ntitle
	texture_rect.texture = ntexture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_close_pressed():
	queue_free()
