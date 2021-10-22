extends Sprite
class_name Player

signal stats_change

export var texture_1: Texture
export var texture_2: Texture

var statBarsManager

var stats: Dictionary

func initialize(statBarsManager):
	self.statBarsManager = statBarsManager
	reset_values()

func reset_values():
	stats = {
#		"Salud": 100,
		"Ejercicios": 0
	}
	texture = texture_1
	emit_signal("stats_change", stats)

func _update_texture():
	if texture == texture_1:
		texture = texture_2
	else:
		texture = texture_1

func update_stats(stats_update):
	var new_stats = stats
	for stat in stats_update.keys():
		new_stats[stat] = clamp(stats[stat] + stats_update[stat], 0, 100)
	stats = new_stats
	_update_texture()
	emit_signal("stats_change", stats)
	
