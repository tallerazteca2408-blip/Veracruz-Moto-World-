extends Node3D

var velocidad = 0.0
var aceleracion = 12.0
var velocidad_maxima = 35.0
var frenado = 20.0
var velocidad_giro = 2.0

func _process(delta):
    var acelerando = Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP)
    var frenando = Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN)

    if acelerando:
        velocidad = move_toward(velocidad, velocidad_maxima, aceleracion * delta)
    elif frenando:
        velocidad = move_toward(velocidad, 0.0, frenado * delta)
    else:
        velocidad = move_toward(velocidad, 0.0, 3.0 * delta)

    var izquierda = Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT)
    var derecha = Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT)

    var direccion = 0

    if izquierda:
        direccion = -1
    elif derecha:
        direccion = 1

    if abs(velocidad) > 0.1:
        rotate_y(-direccion * velocidad_giro * delta)

    translate(Vector3(0, 0, -velocidad * delta))
