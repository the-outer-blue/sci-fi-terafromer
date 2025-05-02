extends Button
@onready var gm=%gamemanger


func _on_gamemanger_remove_o_2(check) -> void:
	visible=check

func _pressed() -> void:
	gm.increase_o2(-10)
	gm.increase_money(-1000)
