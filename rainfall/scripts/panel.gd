extends Panel

var time : float = 0.0
var min : int = 0
var sec : int = 0
var msec : int = 0

func _process(delta):
	time += delta
	msec = fmod(time, 1) * 100
	sec = fmod(time, 60)
	min = fmod(time, 3600) / 60
	$Label.text = "%02d:" % min
	$Label2.text = "%02d:" % sec
	$Label3.text = "%03d" % msec
