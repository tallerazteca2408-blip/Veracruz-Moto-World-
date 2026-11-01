extends Node3D

var sistema_danos
var sistema_combustible
var sistema_dinero
var sistema_misiones
var sistema_carreras
var sistema_sonido

func _ready():
    crear_sistemas()
    crear_suelo()
    crear_carretera()
    crear_motocicleta()
    crear_luz()
    crear_camara()

func crear_sistemas():
    sistema_danos = Node.new()
    sistema_danos.set_script(load("res://vehiculos/danos_moto.gd"))
    add_child(sistema_danos)

    sistema_combustible = Node.new()
    sistema_combustible.set_script(load("res://vehiculos/combustible.gd"))
    add_child(sistema_combustible)

    sistema_dinero = Node.new()
    sistema_dinero.set_script(load("res://jugadores/dinero.gd"))
    add_child(sistema_dinero)

    sistema_misiones = Node.new()
    sistema_misiones.set_script(load("res://jugadores/misiones.gd"))
    add_child(sistema_misiones)
    sistema_misiones.configurar(sistema_dinero)

    sistema_carreras = Node.new()
    sistema_carreras.set_script(load("res://jugadores/carreras.gd"))
    add_child(sistema_carreras)

    sistema_sonido = Node3D.new()
    sistema_sonido.set_script(load("res://efectos/sonido_moto.gd"))
    add_child(sistema_sonido)

func crear_suelo():
    var suelo = MeshInstance3D.new()
    var malla = PlaneMesh.new()
    malla.size = Vector2(20000, 20000)
    suelo.mesh = malla

    var material = StandardMaterial3D.new()
    material.albedo_color = Color(0.25, 0.45, 0.20)
    suelo.material_override = material
    add_child(suelo)

func crear_carretera():
    var carretera = MeshInstance3D.new()
    var malla = BoxMesh.new()
    malla.size = Vector3(8, 0.1, 100)
    carretera.mesh = malla
    carretera.position.y = 0.15
    add_child(carretera)

func crear_motocicleta():
    var moto = Node3D.new()
    moto.name = "Motocicleta"

    var modelo = Node3D.new()
    modelo.name = "ModeloNC750X"
    modelo.set_script(load("res://vehiculos/motocicleta_3d.gd"))
    moto.add_child(modelo)

    moto.set_script(load("res://scripts/motocicleta.gd"))
    moto.position.y = 0.2
    add_child(moto)

func crear_luz():
    var luz = DirectionalLight3D.new()
    luz.rotation_degrees = Vector3(-45, -30, 0)
    add_child(luz)

func crear_camara():
    var camara = Camera3D.new()
    camara.name = "CamaraSeguimiento"
    camara.position = Vector3(0, 3, 7)
    camara.set_script(load("res://camaras/seguimiento.gd"))
    add_child(camara)
    camara.objetivo = get_node("Motocicleta")
    camara.current = true
