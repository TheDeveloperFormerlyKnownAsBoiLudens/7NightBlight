extends Node3D

@onready var snow_particles: GPUParticles3D = %SnowParticles
@onready var player: CharacterBody3D = %Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	snow_particles.global_position = player.global_position
	snow_particles.global_position.y = player.global_position.y + 5