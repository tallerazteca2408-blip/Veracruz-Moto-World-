extends CharacterBody3D

@export var velocidad = 5.0
@export var nombre_jugador = "Jugador"

var conectado = false

func _ready():
    print("Jugador preparado: ", nombre_jugador)

func establecer_nombre(nuevo_nombre: String):
    nombre_jugador = nuevo_nombre

func establecer_conexion(estado: bool):
    conectado = estado

func obtener_datos():
    return {
        "nombre": nombre_jugador,
        "conectado": conectado,
        "posicion": global_position
    }
