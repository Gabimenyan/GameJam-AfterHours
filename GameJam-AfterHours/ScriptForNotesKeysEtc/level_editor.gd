extends Node2D

const in_edit_mode: bool = false
var current_level_name = "RHYTHM_HELL"

var level_info = {
	"RHYTHM_HELL"={
		"fk_times": "[[1, 1.5, 2],[2],[3],[4]]",
		"music": load("res://Music/Clement Panchout_ Kick Me Harder_ 2001.wav")
		
	}
	
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if in_edit_mode:
		pass
	else:
		var fk_times = level_info.get(current_level_name).get("fk_times")
		var fk_times_arr = str_to_var(fk_times)
		print(fk_times_arr[0])
		var counter: int = 0
		for key in fk_times_arr:
			var button_name:String = ""
			match counter:
				0:
					button_name = "W-Lane1"
				1:
					button_name = "A-Lane2"
				2:
					button_name = "S-Lane3"
				3:
					button_name = "D-Lane4"
			for delay in key:
				SpawnFallingKey("",delay)
			counter +=1
			
func SpawnFallingKey(button_name: String, delay: float):
	await get_tree().create_timer(delay).timeout
	Signals.CreateFallingKey.emit(button_name)
