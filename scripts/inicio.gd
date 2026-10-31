extends Node3D

func _ready():
    crear_suelo()
    crear_carretera()
    crear_motocicleta()
    crear_luz()
    crear_camara()

func crear_suelo():
    var suelo = MeshInstance3D.new()
    var malla = BoxMesh.new()
    malla.size = Vector3(100, 0.2, 100)
    suelo.mesh = malla
    add_child(suelo)

func crear_carretera():
    var carretera = MeshInstance3D.new()
    var malla = BoxMesh.new()
    malla.size = Vector3(8, 0.1, 100)
    carretera.mesh = malla
    carretera.position.y = 0.15
    add_child(carretera)

func crear_motocicleta():
    var moto = MeshInstance3D.new()
    var cuerpo = BoxMesh.new()
    cuerpo.size = Vector3(0.7, 0.5, 2)
    moto.mesh = cuerpo
    moto.position.y = 1
    add_child(moto)

func crear_luz():
    var luz = DirectionalLight3D.new()
    luz.rotation_degrees = Vector3(-45, -30, 0)
    add_child(luz)

func crear_camara():
    var camara = Camera3D.new()
    camara.position = Vector3(8, 7, 10)
    camara.look_at(Vector3(0, 0, 0))
    add_child(camara)
