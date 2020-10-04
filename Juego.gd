extends KinematicBody

var velocidadDeMovimiento = 10
var velocidadDeRotacion = 0.85

var movimiento = Vector3.ZERO

func _ready():
	pass

func get_input(delta):
	movimiento = Vector3.ZERO
	if(Input.is_action_pressed("ui_up")):
		movimiento +=  transform.basis.x * velocidadDeMovimiento
		pass
	if(Input.is_action_pressed("ui_down")):
		movimiento += -transform.basis.x * velocidadDeMovimiento
		pass
	if(Input.is_action_pressed("ui_right")):
		rotate_y(-velocidadDeRotacion * delta)
		pass
	if(Input.is_action_pressed("ui_left")):
		rotate_y(velocidadDeRotacion * delta)
		pass
	pass

func _physics_process(_delta):
	get_input(_delta)
	movimiento = move_and_slide(movimiento, Vector3.UP)
