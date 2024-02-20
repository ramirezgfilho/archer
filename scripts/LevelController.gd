extends Node


signal game_end
signal level_up

@export var level_timer = 0

var score = 0

func _on_score_timer_timeout():
	aumenta_score(1)

func aumenta_score(valor):
	score += valor
	if score % 200 == 0:
		level_up.emit()
		
	
func _physics_process(delta):
	%Score.set_text(str(score))
	%Timer.set_text(str(level_timer))

func _on_game_timer_timeout():
	level_timer += 1
	if(%MobTimer.wait_time > 0.6):
		if(level_timer % 60 == 0):
			diminui_tempo_mob()	
	if level_timer >= 1800:
		game_end.emit()

func diminui_tempo_mob():
	%MobTimer.wait_time -= 0.10
	print("Tempo de spawn: ", %MobTimer.wait_time)
