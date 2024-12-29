extends Node

func found_in_list(search):
	if search == "":
		return true
	var hud_player = get_tree().get_first_node_in_group("hud")
	var itemlist = hud_player.get_child(0)
	for i in range(itemlist.get_item_count()):
		if itemlist.get_item_text(i) == search:
			return true
	return false 

func action_pop_up(ntitle, path_dial):
	var popup_scene = load("res://Prefab/pop_up.tscn")
	var popup_instance = popup_scene.instantiate()
	get_tree().get_root().add_child(popup_instance)
	popup_instance.set_up(ntitle, path_dial)

func action_pickable(object_name,icon_inventory):
	var hud_player = get_tree().get_first_node_in_group("hud")
	var itemlist = hud_player.get_child(0)
	print("add item")
	itemlist.add_item(object_name,icon_inventory,false)

func action_change_scene(nscene):
	get_tree().change_scene_to_packed(nscene)
	
func action_zoom(ntitle, ntexture):
	var popup_scene = load("res://Prefab/zoom.tscn")
	var popup_instance = popup_scene.instantiate()
	get_tree().get_root().add_child(popup_instance)
	popup_instance.set_up(ntitle, ntexture)
