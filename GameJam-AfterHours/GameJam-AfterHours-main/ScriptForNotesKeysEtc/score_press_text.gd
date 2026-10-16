extends Control

#Perfect fcc800fb
#Great cddc01fb
#Good 16f77efb
#OK 00b59ffb
#Miss 444444fb

func SetTextInfo(text: String):
	$ScoreLevelText.text = "[center]" + text
	
	match text:
		"PERFECT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("fcc800fb"))
		"GREAT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("cddc01fb"))
		"GOOD":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("16f77efb"))
		"OK":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("00b59ffb"))
		_:
			$ScoreLevelText.set("theme_override_colors/default_color", Color("444444fb"))
