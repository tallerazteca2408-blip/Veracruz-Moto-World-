extends Node3D

@export var precio_litro = 24.0
@export var radio_servicio = 5.0

var jugador = null
var combustible = null

func configurar(moto: Node3D, sistema_combustible: Node):
    jugador = moto
    combustible = sistema_combustible

func _process(_delta):
    if jugador == null or combustible == null:
        return

    var distancia = global_position.distance_to(
        jugador.global_position
    )

    if distancia <= radio_servicio:
        if Input.is_key_pressed(KEY_E):
            combustible.cargar_gasolina(0.05)

func obtener_precio(cantidad: float) -> float:
    return cantidad * precio_litro
