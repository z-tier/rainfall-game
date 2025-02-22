extends Resource
class_name GameSave

const SAVE_GAME_PATH = "user://new_resource.tres"
@export var difficulty : String = ""
@export var highest_time : float = 0.000

func save_game():
	ResourceSaver.save(self, SAVE_GAME_PATH)

static func load_save():
	if ResourceLoader.load(SAVE_GAME_PATH):
		return load(SAVE_GAME_PATH)
	return null
