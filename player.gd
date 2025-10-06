extends CharacterBody3D

var forward = transform.basis.x
@onready var bitcoin: MeshInstance3D = $CollisionShape3D/bitcoin
@onready var tunnel: CollisionShape3D = $"../Components/2/CSGCylinder3D/CSGCylinder3D2/Area3D/CollisionShape3D"
@onready var Pointslabel: Label = $"../MarginContainer/Label"
@onready var animation: AnimationPlayer = $CollisionShape3D/bitcoin/AnimationPlayer


var onTunnel = false
var atceiling = false

const SPEED = 4
const JUMP_VELOCITY = 4.5
const rollingSPEED = -140000000
func _ready() -> void:
	Engine.time_scale = 0
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
		
		if onTunnel == true and atceiling == false:
			#PhysicsServer3D.area_set_param(get_viewport().find_world_3d().space, PhysicsServer3D.AREA_PARAM_GRAVITY_VECTOR, Vector3(1,10,0))
			atceiling = true
		#elif atceiling == true:
			#print("ei")
			#PhysicsServer3D.area_set_param(get_viewport().find_world_3d().space, PhysicsServer3D.AREA_PARAM_GRAVITY_VECTOR, Vector3(0,-1,0))
	var input_dir := Input.get_vector("move_left", "move_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	velocity.x = forward.x * rollingSPEED
	#if onTunnel == false:
		#PhysicsServer3D.area_set_param(get_viewport().find_world_3d().space, PhysicsServer3D.AREA_PARAM_GRAVITY_VECTOR, Vector3(0,-1,0))

	if is_on_floor():
		bitcoin.rotate_x(0.05)
	else:
		bitcoin.rotate_x(0.025)
	if direction:
		velocity.z = direction.z * SPEED
	else:
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	move_and_slide()


func tunnel_entered(body: Node3D) -> void:
	onTunnel = true


func tunnel_exited(body: Node3D) -> void:
	onTunnel = false
	
