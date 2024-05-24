local state = {}

function state:enter(player)
	player.time = 5
	player.animation:changeAnim("cling", 1)
	player.momy = 0
	player.flags.canchangedir = false
	player.flags.nogravity = true
end

function state:update(player, dt)
	if controls:isJustPressed("Jump") then
		player.flags.jumpheld = true
		player.gravity = gravity/1.5
		player.momy = -14/1.5
		player.sounds.jump:play()

		player.dir = player.dir * -1
		
		player.momx = 6*player.dir

		player:fsm("base")
	end
end

function state:exit(player)
	player.time = 0
	player.flags.nogravity = false
	player.flags.canchangedir = true
end

return state