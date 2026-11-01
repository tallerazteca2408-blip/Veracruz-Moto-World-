extends Node3D

var motor: AudioStreamPlayer3D
var volumen_motor = -10.0

func _ready():
    motor = AudioStreamPlayer3D.new()
    motor.name = "SonidoMotor"
    motor.volume_db = volumen_motor
    motor.max_distance = 50.0
    add_child(motor)

func reproducir_motor(sonido):
    motor.stream = sonido
    motor.play()

func detener_motor():
    motor.stop()

func ajustar_volumen(valor: float):
    motor.volume_db = clamp(valor, -30.0, 0.0)
