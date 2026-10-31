extends CharacterBody3D

@export var velocidad = 8.0
@export var distancia_recorrido = 50.0

var posicion_inicial = Vector3.ZERO
var distancia_avanzada = 0.0

func _ready():
    posicion_inicial = global_position

func _physics_process(delta):
    velocity = -global_transform.basis.z * velocidad
    move_and_slide()

    distancia_avanzada += velocidad * delta

    if distancia_avanzada >= distancia_recorrido:
        global_position = posicion_inicial
        distancia_avanzada = 0.0
