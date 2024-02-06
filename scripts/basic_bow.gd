extends Area2D

@export_group("Bow proprieties")
@export var basic_damage = 1
@export var arrow_speed = 1
@export var range = 1


func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
		
		
func shoot():
	const PROJECTILE = preload("res://cenas/arrow.tscn")
	var new_bullet = PROJECTILE.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)

func _on_arrow_timer_timeout():
		shoot()
