extends Sprite




func _on_Area2D_body_entered(body):
	self.visible = false

	if SoundController.sound_on == true:
		$Collect_sn.play()

