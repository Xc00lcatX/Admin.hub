-- CONFIGURACIÓN
local ADMIN_USER_ID = 9867661055-- 
local STAT_NAME = "Brunito Marsito"    -- local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(msg)
		-- Verifica si eres tú
		if player.UserId ~= ADMIN_USER_ID then return end

		-- Divide el mensaje
		local args = string.split(msg, " ")

		-- Comando :brainrot cantidad
		if args[1]:lower() == ":brainrot" then
			local amount = tonumber(args[2])
			if not amount then return end

			local stats = player:FindFirstChild("leaderstats")
			if not stats then return end

			local brainrot = stats:FindFirstChild(STAT_NAME)
			if not brainrot then
				brainrot = Instance.new("IntValue")
				brainrot.Name = STAT_NAME
				brainrot.Value = 0
				brainrot.Parent = stats
			end

			brainrot.Value += amount
		end
	end)
end)
