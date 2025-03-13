extends Node2D
signal endLevel

func _on_child_exiting_tree(_node: Node) -> void:
	emit_signal("endLevel")
