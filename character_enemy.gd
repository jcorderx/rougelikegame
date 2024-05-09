extends CharacterBody2D

class_name CharacterEnemy
@onready var anim = $EnemyContainer/AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():	
	anim.play("idle")
	#anim2.play("idle")

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

