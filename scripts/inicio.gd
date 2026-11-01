
extends Node3D

func _ready():
    crear_suelo()
    crear_carretera()
    crear_motocicleta()
    crear_luz()
    crear_camara()

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

    moto.position.y = 0.2
    moto.set_script(load("res://scripts/motocicleta.gd"))

    add_child(moto)

func crear_luz():
    var luz = DirectionalLight3D.new()
    luz.rotation_degrees = Vector3(-45, -30, 0)
    add_child(luz)

func crear_camara():
    var camara = Camera3D.new()
    camara.name = "CamaraSeguimiento"
    camara.position = Vector3(0, 3, 7)
    camara.current = true

    camara.set_script(load("res://camaras/seguimiento.gd"))

    add_child(camara)
    camara.objetivo = get_node("Motocicleta")
