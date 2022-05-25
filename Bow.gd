extends Spatial

var ARROW_PRELOAD = preload("res://Arrow_real.tscn")

onready var arrow_loc : Position3D= $ArrowLocation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("draw"):
		var arrow = ARROW_PRELOAD.instance()
		arrow.look_at(-global_transform.basis.x, Vector3.UP)
		
		arrow.global_transform.origin = arrow_loc.global_transform.origin
		
		get_tree().get_root().add_child(arrow)
	
