if SAM_LOADED then return end
local sam, command = sam, sam.command
command.set_category("Map Vote")
command.new("startmapvote")
	:SetPermission("startmapvote", "superadmin")
	:AddArg("number", {
        optional = false, -- makes it optional!
        default = 30,
        hint = "amount",
        min = 1,
        max = 120,
        round = true,
    })
	:Help("Start a map vote.")

	:OnExecute(function(ply, time)
		MapVote.Start(time, nil, nil, nil)

		if sam.is_command_silent then return end
		sam.player.send_message(nil, "{A} has started a map vote.", {
			A = ply
		})
	end)
:End()
command.new("stopmapvote")
	:SetPermission("stopmapvote", "superadmin")
	:Help("Stop a map vote.")

	:OnExecute(function(ply)
		MapVote.Cancel()

		if sam.is_command_silent then return end
		sam.player.send_message(nil, "{A} has stopped a map vote.", {
			A = ply
		})
	end)
:End()