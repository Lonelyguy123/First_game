extends KinematicBody2D
class_name Character, "res://Assets/v1.1 dungeon crawler 16X16 pixel pack/v1.1 dungeon crawler 16X16 pixel pack/heroes/knight/knight_idle_anim_f0.png"



const Friction: float  = 0.15

export(int) var acceleration : int = 40
export(int) var max_speed : int = 150

var mov_direction: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity = move_and_slide(velocity)
	velocity = lerp(velocity, Vector2.ZERO, Friction)
	
func move() -> void:
	mov_direction = mov_direction.normalized()
	velocity+= mov_direction * acceleration
	velocity = velocity.clamped(max_speed)
	
