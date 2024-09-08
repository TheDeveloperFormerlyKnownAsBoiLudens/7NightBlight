extends BeehaveTree 

@export var player: CharacterBody3D

@onready var walk_to_owner_action: ActionLeaf = %WalkToOwnerAction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().root.ready
	walk_to_owner_action.player = player


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
