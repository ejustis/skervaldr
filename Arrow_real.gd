extends RigidBody

onready var alive_timer : Timer = $AliveTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#alive_timer.start()

func _on_AliveTimer_timeout():
	queue_free()
