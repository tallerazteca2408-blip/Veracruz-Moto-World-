extends Node3D

@export var precio_reparacion = 500.0
@export var radio_servicio = 5.0

var jugador = null
var sistema_danos = null

func configurar(moto: Node3D, danos: Node):
    jugador = moto
    sistema_danos = danos

func _process(_delta):
    if jugador == null or sistema_danos == null:
        return

    var distancia = global_position.distance_to(
        jugador.global_position
    )

    if distancia <= radio_servicio:
        if Input.is_key_pressed(KEY_E):
            sistema_danos.reparar(0.1)

func obtener_precio() -> float:
    return precio_reparacion
