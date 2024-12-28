extends Area2D

#remplir dans l'editeur direct
@export var object_name:String

@export_category("condition")
@export var item_condition:String
@export_category("change Scene")
@export var go_to_scene:bool
@export var new_scene:PackedScene
@export_category("pickable")
@export var pickable:bool
@export var icon_inventory:Texture2D
@export_category("pop_up")
@export var pop_up:bool
@export var id:String
@export_category("zoom")
@export var zoom:bool
@export var zoom_texture:Texture2D

#pas touche
var can_click:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if Input.is_action_pressed("click") and can_click == true:
		object_job()

func object_job():
	if Tools.found_in_list(item_condition) == true:
		if go_to_scene == true:
			Tools.action_change_scene(new_scene)
		if pickable == true:
			Tools.action_pickable(object_name, icon_inventory)
			queue_free()
		if pop_up == true:
			Tools.action_pop_up(object_name, id)
		if zoom == true:
			Tools.action_zoom(object_name, zoom_texture)

func _on_mouse_entered():
	can_click = true
	print("in : ",object_name)

func _on_mouse_exited():
	can_click = false
	print("out : ",object_name)
