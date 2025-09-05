extends CharacterBody2D

const MAX_SPEED = 200

func _ready ():
    pass

func _process(_delta):
    var movement_vector = _get_movement_vector()
    var direction = movement_vector.normalized()
    velocity = direction * MAX_SPEED
    move_and_slide()

func _get_movement_vector():
    var x_movent = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
    var y_movent = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
    return Vector2(x_movent, y_movent)




