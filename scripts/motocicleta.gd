
extends Node3D

var velocidad = 0.0
var aceleracion = 12.0
var velocidad_maxima = 35.0
var frenado = 20.0
var velocidad_giro = 2.0

var combustible = null
var danos = null
var direccion_joystick = Vector2.ZERO
var acelerando_tactil = false
var frenando_tactil = false

func configurar(sistema_combustible, sistema_danos):
    combustible = sistema_combustible
    danos = sistema_danos

func establecer_direccion(direccion: Vector2):
    direccion_joystick = direccion

func establecer_aceleracion(estado: bool):
    acelerando_tactil = estado

func establecer_freno(estado: bool):
    frenando_tactil = estado

func _process(delta):
    var acelerando = acelerando_tactil or Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP)
    var frenando = frenando_tactil or Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN)

    if acelerando and (combustible == null or combustible.gasolina > 0.0):
        velocidad = move_toward(velocidad, velocidad_maxima, aceleracion * delta)
    elif frenando:
        velocidad = move_toward(velocidad, 0.0, frenado * delta)
    else:
        velocidad = move_toward(velocidad, 0.0, 3.0 * delta)

    if combustible != null:
        combustible.consumir_gasolina(delta, acelerando)

    if danos != null:
        danos.agregar_desgaste(delta * velocidad * 0.001)

    var direccion = direccion_joystick.x

    if Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT):
        direccion = -1.0
    elif Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT):
        direccion = 1.0

    if abs(velocidad) > 0.1:
        rotate_y(-direccion * velocidad_giro * delta)

    translate(Vector3(0, 0, -velocidad * delta))
