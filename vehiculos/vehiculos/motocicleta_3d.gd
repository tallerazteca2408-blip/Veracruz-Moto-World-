
extends Node3D

var negro = Color(0.025, 0.025, 0.03)
var gris = Color(0.3, 0.3, 0.32)
var metal = Color(0.55, 0.55, 0.58)
var rojo = Color(0.8, 0.02, 0.02)

func _ready():
    crear_ruedas()
    crear_carenado()
    crear_asiento()
    crear_manubrio()
    crear_parabrisas()
    crear_escape()
    crear_faroles()

func crear_pieza(nombre, tamano, posicion, color):
    var pieza = MeshInstance3D.new()
    pieza.name = nombre

    var malla = BoxMesh.new()
    malla.size = tamano
    pieza.mesh = malla
    pieza.position = posicion

    var material = StandardMaterial3D.new()
    material.albedo_color = color
    pieza.material_override = material

    add_child(pieza)
    return pieza

func crear_ruedas():
    for z in [-1.2, 1.2]:
        var rueda = MeshInstance3D.new()
        var malla = CylinderMesh.new()
        malla.top_radius = 0.42
        malla.bottom_radius = 0.42
        malla.height = 0.22

        rueda.mesh = malla
        rueda.position = Vector3(0, 0.43, z)
        rueda.rotation_degrees.z = 90

        var material = StandardMaterial3D.new()
        material.albedo_color = negro
        rueda.material_override = material
        add_child(rueda)

        var rin = MeshInstance3D.new()
        var malla_rin = CylinderMesh.new()
        malla_rin.top_radius = 0.22
        malla_rin.bottom_radius = 0.22
        malla_rin.height = 0.24

        rin.mesh = malla_rin
        rin.position = rueda.position
        rin.rotation_degrees.z = 90

        var material_rin = StandardMaterial3D.new()
        material_rin.albedo_color = metal
        rin.material_override = material_rin
        add_child(rin)

func crear_carenado():
    crear_pieza("Deposito", Vector3(0.85, 0.65, 0.9), Vector3(0, 1.15, 0), negro)
    crear_pieza("Carenado_delantero", Vector3(0.95, 0.8, 0.5), Vector3(0, 1.25, -0.75), negro)
    crear_pieza("Motor", Vector3(0.8, 0.65, 0.7), Vector3(0, 0.8, 0.25), gris)
    crear_pieza("Guardabarros", Vector3(0.65, 0.12, 0.8), Vector3(0, 0.9, -1.2), negro)

func crear_asiento():
    crear_pieza("Asiento_delantero", Vector3(0.65, 0.18, 0.85), Vector3(0, 1.5, 0.55), negro)
    crear_pieza("Asiento_trasero", Vector3(0.6, 0.16, 0.65), Vector3(0, 1.55, 1.1), negro)

func crear_manubrio():
    crear_pieza("Manubrio", Vector3(1.15, 0.08, 0.12), Vector3(0, 1.75, -0.9), metal)
    crear_pieza("Espejo_izquierdo", Vector3(0.08, 0.35, 0.08), Vector3(-0.48, 2, -0.85), gris)
    crear_pieza("Espejo_derecho", Vector3(0.08, 0.35, 0.08), Vector3(0.48, 2, -0.85), gris)

func crear_parabrisas():
    crear_pieza("Parabrisas", Vector3(0.65, 0.55, 0.08), Vector3(0, 1.85, -0.95), gris)

func crear_escape():
    crear_pieza("Escape", Vector3(0.2, 0.25, 0.9), Vector3(0.48, 0.65, 0.65), metal)

func crear_faroles():
    crear_pieza("Faro_delantero", Vector3(0.45, 0.22, 0.12), Vector3(0, 1.25, -1.03), Color.WHITE)
    crear_pieza("Luz_trasera", Vector3(0.35, 0.15, 0.1), Vector3(0, 1.4, 1.45), rojo)
