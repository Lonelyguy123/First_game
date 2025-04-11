extends CanvasLayer

const MIN_HEALTH: int = 23

var max_hp: int = 4

onready var player: KinematicBody2D = get_parent().get_node("Player")
onready var health_bar: TextureProgress = get_node("Health-Bar")
onready var health_bar_tween: Tween = get_node("Health-Bar/Tween")

func _ready() -> void:
	max_hp = player.hp
	_update_health_bar(100)
	
func _update_health_bar(new_value: int) -> void:
	var __ = health_bar_tween.interpolate_property(health_bar,"value",health_bar.value, new_value , 0.5 , Tween.TRANS_QUART, Tween.EASE_OUT)
	health_bar_tween.start()
	


func _on_Player_hp_changed(new_hp: int) -> void:
	var new_health: int = int((100-MIN_HEALTH) * float(new_hp) / max_hp) + MIN_HEALTH
	_update_health_bar(new_health)
