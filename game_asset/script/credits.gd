extends Control

func _on_voltar_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/boneco.tscn")


func _on_canal_musico_pressed():
	OS.shell_open("https://www.youtube.com/@MobGenerico")


func _on_klebercanal_pressed():
	OS.shell_open("https://www.youtube.com/@CanalKleberiano")
