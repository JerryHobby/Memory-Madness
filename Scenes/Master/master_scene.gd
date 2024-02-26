extends CanvasLayer
@onready var main_screen = $MainScreen
@onready var game_screen = $GameScreen
@onready var sound = $Sound


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)
	SignalManager.on_level_selected.connect(on_level_selected)
	show_game(false)
	SoundManager.play_sound(sound, SoundManager.SOUND_MAIN_MENU)


func show_game(s:bool) -> void:
	main_screen.visible = !s
	game_screen.visible = s


func on_game_exit_pressed():
	show_game(false)
	GameManager.clear_nodes_in_group(GameManager.GROUP_TILE)
	SoundManager.play_sound(sound, SoundManager.SOUND_MAIN_MENU)


func on_level_selected(level_num:int):
	show_game(true)
	SoundManager.play_sound(sound, SoundManager.SOUND_IN_GAME)
