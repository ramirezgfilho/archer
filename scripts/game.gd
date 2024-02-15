extends Node2D

@onready var player = get_node("Player")

func spawn_mob():
	var new_mob = preload("res://cenas/orc.tscn").instantiate()
	%PathFollow2DAreaOne.progress_ratio = randf()
	new_mob.global_position = %PathFollow2DAreaOne.global_position
	add_child(new_mob)
	
	var new_mob2 = preload("res://cenas/orc.tscn").instantiate()
	%PathFollow2DAreaTwo.progress_ratio = randf()
	new_mob2.global_position = %PathFollow2DAreaTwo.global_position
	add_child(new_mob2)
	
	var new_mob3 = preload("res://cenas/orc.tscn").instantiate()
	%PathFollow2DAreaThree.progress_ratio = randf()
	new_mob3.global_position = %PathFollow2DAreaThree.global_position
	add_child(new_mob3)
	
func spawn_cogumelo():
	var new_cog = preload("res://cenas/cogumelo.tscn").instantiate()
	%CogumeloPosi1.progress_ratio = randf()
	new_cog.global_position = %CogumeloPosi1.global_position
	add_child(new_cog)
	
	var new_cog2 = preload("res://cenas/cogumelo.tscn").instantiate()
	%CogumeloPosi2.progress_ratio = randf()
	new_cog2.global_position = %CogumeloPosi2.global_position
	add_child(new_cog2)
	

func _physics_process(delta):
	%PlayerHealth.value = player.health
	%PlayerStamina.value = player.stamina

func _on_mob_timer_timeout():
	spawn_mob()

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
	get_tree().quit()

func _on_player_vida_terminou():
	%GameOverScreen.visible = true
	%PauseButton.visible = false
	get_tree().paused = true

func _on_child_exiting_tree(orc):
	%LevelController.aumenta_score(5)


func _on_cogumelo_timer_timeout():
	spawn_cogumelo()
