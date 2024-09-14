extends Node3D

@export var next_scene: Resource

@onready var snow_particles: GPUParticles3D = %SnowParticles
@onready var player: CharacterBody3D = %Player
@onready var director: Node = %Director

func _physics_process(delta: float) -> void:
	snow_particles.global_position = player.global_position
	snow_particles.global_position.y = player.global_position.y + 5

func _on_goal_body_entered(body:Node3D) -> void:
	if director.get_from_inventory("Tent"):
		GameManager.change_scene(next_scene.resource_path)
