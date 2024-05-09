extends Node2D


#var enemy_instance = preload("res://src/Dragon.tres").instance()
@onready var anim = "res://src/Char.gd"
@onready var anim_enemy = "res://character_enemy.gd"
#@onready var progress_bar = $EnemyContainer/EnemyHealthBar

var enemy = EnemyState.new()
var charEnemy = CharacterEnemy.new()
var anime: AnimatedSprite2D
var progress_bar : ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	set_health($Character/PlayerContainer/PlayerHealthBar, State.current_health, State.max_health)
	set_health($CharacterEnemy/EnemyContainer/EnemyHealthBar, enemy.current_health, enemy.max_health)
	anime = $CharacterEnemy/EnemyContainer/AnimatedSprite2D
	progress_bar = $CharacterEnemy/EnemyContainer/EnemyHealthBar
	$Background/TextPanel.hide()
	#$BattleUI.hide()
	display_text("hello from primary")

func _input(event):
	if (Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) and $Background/TextPanel/Textbox.visible:
		$Background/TextPanel.hide()

func display_text(text):
	$Background/TextPanel.show()
	$Background/TextPanel/Textbox.text = text


func set_health(progress_bar, health, max_health):
	progress_bar.value = health
	progress_bar.max_value = max_health
	progress_bar.get_node("HealthLabel").text = "HP: %d/%d" % [health, max_health]

func _on_attack_pressed():
	_when_attacked(progress_bar, progress_bar.value, 5)

func _when_attacked(progress_bar, health, damage):
	_update_progess_bar(progress_bar, health, damage)
	anime.play("hurt")
	await get_tree().create_timer(0.5).timeout
	anime.stop()
	anime.play("idle")


func _update_progess_bar(progress_bar, health, damage):
	progress_bar.value = health - damage
	progress_bar.get_node("HealthLabel").text = "HP: %d/%d" % [progress_bar.value, progress_bar.max_value]
	print("I BET YOU FUCKING MADE IT")
	print(progress_bar.value)
	if progress_bar.value == 0:
		print("Just fucking kill me")

	#Works correctly up to this point, is not updating the visual for the health bar and is not playing the animation for hurt

