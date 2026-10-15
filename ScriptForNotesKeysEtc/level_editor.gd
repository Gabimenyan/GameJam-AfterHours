extends Node2D

const in_edit_mode: bool = false
var current_level_name = "RHYTHM_HELL"

#fk is for FUCK sjssjssj joking its for falling key 
#Time it takes for falling key
var fk_fall_time: float = 1.53
var fk_output_arr = [[], [], [], []]

var level_info = {
	"RHYTHM_HELL"={
		"fk_times": "[[4.28599998474121, 7.72066661834717, 8.00866672515869, 8.1686665725708, 8.39266654968262, 11.5180003356934, 12.488666267395], [3.75266668319702, 11.8166663360596, 12.7766663742065], [3.19800016403198, 7.35799953460693, 11.2833335113525, 12.2966668319702], [4.7660000038147, 8.80866691589356, 12.904666633606]]",
		"music": load("res://Rhythm Hell (1).wav")
		
	}
	
}
#[[1,4,5,7,.10,12],[2,3,5,7,8],[3],[4]]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$MusicPlayer.stream = level_info.get(current_level_name).get("music")
	$MusicPlayer.play()
	if in_edit_mode:
		Signals.KeyListenerPress.connect(KeyListenerPress)
	else:
		var fk_times = level_info.get(current_level_name).get("fk_times")
		var fk_times_arr = str_to_var(fk_times)
		
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
				SpawnFallingKey(button_name,delay)
			counter +=1

func KeyListenerPress(button_name: String, array_num: int):
	#print(str(array_num) + " " + str($MusicPlayer.get_playback_position() ))
	fk_output_arr[array_num].append($MusicPlayer.get_playback_position() - fk_fall_time)
func SpawnFallingKey(button_name: String, delay: float):
	await get_tree().create_timer(delay).timeout
	Signals.CreateFallingKey.emit(button_name)


func _on_music_player_finished() -> void:
	print(fk_output_arr)
