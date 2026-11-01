extends Node3D

@export var ancho_mapa = 20000.0
@export var largo_mapa = 20000.0

func _ready():
    crear_terreno()

func crear_terreno():
    var terreno = MeshInstance3D.new()
    var malla = PlaneMesh.new()

    malla.size = Vector2(ancho_mapa, largo_mapa)
    terreno.mesh = malla

    var material = StandardMaterial3D.new()
    material.albedo_color = Color(0.25, 0.45, 0.20)
    terreno.material_override = material

    add_child(terreno)
