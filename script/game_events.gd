extends Node


signal experience_gem_collected(number: float)

func emit_experience_gem_collected(number: float):
    experience_gem_collected.emit(number)
