extends AudioStreamPlayer

@onready var music: AudioStreamPlayer = $Music
@onready var sfx: AudioStreamPlayer = $SFX

var music_tween: Tween
var footsteps_tween: Tween

	
@warning_ignore("unused_parameter")
func play_music(stream: AudioStream, fade_time := 1.5):
	
	if music.stream == stream:
		return

	if music_tween:
		music_tween.kill()

	music_tween = create_tween()

	if music.playing:
		music_tween.tween_property(music, "volume_db", -40, fade_time)

	music_tween.tween_callback(func():
		music.stream = stream
		music.volume_db = -40
		music.play()
	)

	music_tween.tween_property(music, "volume_db", 0, fade_time)


func stop_music(fade_time := 1.5):
	if not music.playing:
		return
	
	music.stream.loop = true
	if music_tween:
		music_tween.kill()

	music_tween = create_tween()
	music_tween.tween_property(music, "volume_db", -40, fade_time)
	music_tween.tween_callback(func():
		music.stop()
	)


#SFX
func play_sfx(stream: AudioStream, volume_db := -5):
	sfx.volume_db = volume_db
	sfx.stream = stream
	sfx.play()
