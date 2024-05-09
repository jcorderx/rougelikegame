extends AnimatedSprite2D

class_name Character
@onready var anim = $"."
#@onready var anim2 = $"../../Character2"

# Called when the node enters the scene tree for the first time.
func _ready():	
	anim.play("idle")
	#anim2.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
