extends Camera3D

@export var objetivo: Node3D
@export var distancia = 7.0
@export var altura = 3.0
@export var suavidad = 5.0

func _process(delta):
    if objetivo == null:
        return

    var posicion_objetivo = objetivo.global_position
    var posicion_deseada = posicion_objetivo + Vector3(0, altura, distancia)

    global_position = global_position.lerp(
        posicion_deseada,
        suavidad * delta
    )

    look_at(posicion_objetivo, Vector3.UP)
