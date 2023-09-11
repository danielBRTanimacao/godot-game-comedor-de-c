extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/wolrd_game.tscn")


func _on_credits_pressed():
	pass # Tem nada aqui ksksk


func _on_exit_pressed():
	get_tree().quit()


func _on_button_pressed():
	OS.shell_open("https://www.youtube.com/channel/UCS88R5WOovJNe3NtS0OhUfg")
