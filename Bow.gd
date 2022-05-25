extends Spatial

var ARROW_PRELOAD = preload("res://Arrow_real.tscn")

var draw_time : float = -0.2
var max_velocity_mult : int = 5
var min_velocity_mult : int = 1

var arrow : Spatial
onready var arrow_loc : Position3D= $ArrowLocation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_pressed("draw"):
		if draw_time < 0:
			arrow = ARROW_PRELOAD.instance()
			arrow.hide()
			arrow.sleeping = true
			arrow_loc.add_child(arrow)
			
			arrow.show()
			draw_time = 0
		
		draw_time += delta
	if Input.is_action_just_released("draw"):
		if arrow:
			draw_time += min_velocity_mult

			arrow_loc.remove_child(arrow)
			get_tree().get_root().add_child(arrow)
			arrow.sleeping = false
			
			var velocity_mult : float = clamp(draw_time, min_velocity_mult, max_velocity_mult)
			arrow.apply_impulse(Vector3(0,0,0), arrow.rotation.normalized() * velocity_mult)
			arrow.alive_timer.start()
			
		draw_time = -1
		
	
