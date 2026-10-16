extends Sprite2D

@export var fall_speed: float = 2.5

var init_x_pos: float = 1000
	# Called when the node enters the scene tree for the first time.
#true if passed allowed rangee
var has_passed: bool = false
var pass_threshold = 300.0

func _init() -> void:
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += Vector2(fall_speed * -1, 0)
	# Find out how long it takes the arrow to reach to hitline/inputlistener
	if global_position.x < pass_threshold and not $Timer.is_stopped() :
		print($Timer.time_left)
		$Timer.stop()
		has_passed = true
		
func Setup(target_y: float, target_frame: int):
	
		global_position = Vector2(init_x_pos, target_y)
		frame = target_frame
		set_process(true)
	


func _on_destroy_timer_timeout() -> void:
	queue_free()
