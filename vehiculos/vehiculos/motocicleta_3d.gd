extends Node3D

@export var color_carroceria = Color(0.1, 0.1, 0.1)

func _ready():
    crear_carroceria()
    crear_rueda(Vector3(0, 0.35, -0.8))
    crear_rueda(Vector3(0, 0.35, 0.8)

func crear_carroceria():
    var cuerpo = MeshInstance3D.new()
    var malla = BoxMesh.new()
    malla.size = Vector3(0.6, 0.5, 1.5)
    cuerpo.mesh = malla

    var material = StandardMaterial3D.new()
    material.albedo_color = color_carroceria
    cuerpo.material_override = material

    cuerpo.position.y = 0.8
    add_child(cuerpo)

func crear_rueda(posicion: Vector3):
    var rueda = MeshInstance3D.new()
    var malla = CylinderMesh.new()
    malla.top_radius = 0.35
    malla.bottom_radius = 0.35
    malla.height = 0.18

    rueda.mesh = malla
    rueda.position = posicion
    rueda.rotation_degrees.z = 90

    var material = StandardMaterial3D.new()
    material.albedo_color = Color(0.05, 0.05, 0.05)
    rueda.material_override = material

    add_child(rueda)
