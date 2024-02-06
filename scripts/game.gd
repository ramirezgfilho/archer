extends Node2D

var score = 0

@onready var basic_bow = get_node("Player/BasicBow")


func spawn_mob():
	var new_mob = preload("res://cenas/orc.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func _physics_process(delta):
	%Score.set_text(str(score))
	
	if score > 5:
		basic_bow.basic_damage = 3
	
	
	##var bow = %Player.find_child("BasicBow")
	##if score > 100 && %Player.find_child("BasicBow") != null: 
	##	%Player.remove_child(bow)
		
		

func _on_mob_timer_timeout():
	spawn_mob()

func _on_score_timer_timeout():
	aumenta_score(1)

func _on_child_exiting_tree(orc):
	aumenta_score(5)

func aumenta_score(valor):
	score += valor

func _on_pause_button_pressed():
	%PauseScreen.visible = true
	%PauseButton.visible = false
	get_tree().paused = true
	
func _on_continue_button_pressed():
	get_tree().paused = false
	%PauseScreen.visible = false
	%PauseButton.visible = true

func _on_restart_game_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_exit_game_button_pressed():
	get_tree().quit() # Replace with function body.

func _on_player_vida_terminou():
	%GameOverScreen.visible = true
	%PauseButton.visible = false
	get_tree().paused = true

	
