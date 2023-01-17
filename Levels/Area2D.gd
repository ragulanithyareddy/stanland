extends Area2D


var active = false


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, '_ON_npc_body_entered')
	connect("body_exited", self, '_ON_npc_body_exited')
	
#func _process(delta):
	#$alert.visible= active
	
func _input(event): #ui_accept
	if get_node_or_null('DialogNode')==null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused=true
			var dialog= Dialogic.start('timeline-1')
			dialog.pause_mode=Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end',self,'unpause')
			add_child(dialog)
	
func unpause(timeline_name):
	get_tree().paused=false


func _ON_npc_body_entered(body):
	if body.name == 'MainPlayer':
		active=true

func _ON_npc_body_exited(body):
	if body.name == 'MainPlayer':
		active=false
