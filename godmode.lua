local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local godModeEnabled = false

local function toggleGodMode()
    godModeEnabled = not godModeEnabled
    if godModeEnabled then
        if character then
            character.Humanoid.MaxHealth = math.huge 
            character.Humanoid.Health = math.huge 

            character.Humanoid.Died:Connect(function()
                character.Humanoid.Health = math.huge 
            end)
        end
    else
        if character then
            character.Humanoid.MaxHealth = 100 
            character.Humanoid.Health = 100 
        end
    end
end

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    if godModeEnabled then
        toggleGodMode()
    end
end)
