local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SirShine/public-roblox-scripts/main/OpenSource/UILibs/ShineLib.lua", true))();

loadstring(game:HttpGet("https://raw.githubusercontent.com/TheNuggetEater05/ekaMiffutSmodnaR/main/RollingThunderAISkeletonESP.lua"))()

shared.RollingThunderESPSettings = {
    Skeleton = false,
    Box = false,
    Name = false,
    Healthbar = false,
    Line = false
}

local Window = Library:Create("SirShine [Rolling Thunder]", nil, 1.25);

local CreditsTab = Window:AddTab("Credits");
local ESPTab = Window:AddTab("ESP");
local MiscTab = Window:AddTab("Misc");

-- Credits Tab
CreditsTab:AddLabel("UI Library (Unfinished): SirShine");
CreditsTab:AddLabel("Script: SirShine");
CreditsTab:AddLabel("ESP: Syntax Err0r");

-- ESP Tab
ESPTab:AddToggle("Skeleton", false, function(bool)
    shared.RollingThunderESPSettings.Skeleton = bool;
end)

ESPTab:AddToggle("Box", false, function(bool)
    shared.RollingThunderESPSettings.Box = bool;
end)

-- ESPTab:AddToggle("Name", false, function(bool)
--     shared.RollingThunderESPSettings.Name = bool;
-- end)

-- ESPTab:AddToggle("Healthbar", false, function(bool)
--     shared.RollingThunderESPSettings.Healthbar = bool;
-- end)

-- ESPTab:AddToggle("Line (Tracer)", false, function(bool)
--     shared.RollingThunderESPSettings.Line = bool;
-- end)

-- Misc Tab
MiscTab:AddLabel("Infinite Ammo starts Damaging you");
MiscTab:AddLabel("after emptying the mag you normally would have");
MiscTab:AddLabel("unless you wait a little between every shot.");
MiscTab:AddLabel("I left it in because it's still good for");
MiscTab:AddLabel("Snipers and the China Lake.");


MiscTab:AddToggle("Infinite Ammo and No Recoil", false, function(bool)

    getgenv().infammo = bool;
    
    local aux = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()

    local scriptPath = game:GetService("Players").LocalPlayer.PlayerScripts.Vortex
    local closureConstants = {
        [2] = "string",
        [3] = "find",
        [5] = "Value",
        [6] = ":",
        [7] = "tonumber",
        [9] = 1
    }

    coroutine.wrap(function()
        while wait(2) do
            if not getgenv().infammo then break end;
            if getgenv().infammo and game.Players.LocalPlayer.Character:FindFirstChild("WeaponModel") then
                local closure = aux.searchClosure(scriptPath, "GetAmmoData", 4, closureConstants)
                local closure2 = aux.searchClosure(scriptPath, "GetAmmoData", 2, closureConstants)
                local closure3 = aux.searchClosure(scriptPath, "GetAmmoData", 1, closureConstants)
                debug.setupvalue(closure, 4, math.huge);
                debug.setupvalue(closure2, 2, math.huge);
                debug.setupvalue(closure3, 1, math.huge);
            end
        end
    end)()

end)

-- UI Toggle
game:GetService("UserInputService").InputBegan(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.RightControl then
        Window:ToggleUI();
    end
end)