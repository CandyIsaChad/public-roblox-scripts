local VIM = game:GetService("VirtualInputManager");
local plr = game:GetService("Players").LocalPlayer;
local plrchr = plr.Character or plr.CharacterAdded:Wait();
local plrgui = plr.PlayerGui;
local mainmenucontainer = plrgui:WaitForChild("screens")["main_menu"].container;

local mainMenuDone = false;
local jobSelectDone = false;

local isPremium = false;

getgenv().ok = true;

function Click(a)
	VIM:SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2, a.AbsolutePosition.Y+50, 0, true, a, 1);
	VIM:SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2, a.AbsolutePosition.Y+50, 0, false, a, 1);
end

function serverHop()
	getgenv().ok = false;
	local x = {}
	for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			x[#x + 1] = v.id
		end
	end

	if #x > 0 then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
	end
end

while getgenv().ok do if(not getgenv().ok) then break end
	wait(.1)

	-- [[
	if(true) then
		if(mainmenucontainer.holder.AbsolutePosition.Y < 100 and not mainMenuDone) then
			Click(mainmenucontainer.holder.play);
			wait(1);
			if(mainmenucontainer.holder.AbsolutePosition.Y > 100 and not mainMenuDone) then
				mainMenuDone = true;
			end
		end

		if(mainmenucontainer["house_select"].AbsolutePosition.Y < 200) then
			Click(mainmenucontainer["house_select"].container.select.right.bottom["select_button"]);
			wait(1);
		end

		if(mainmenucontainer["plot_select"].AbsolutePosition.Y < 200) then
			if(isPremium == true) then
				Click(mainmenucontainer["plot_select"]["premium_holder"]["select_button"]);
				wait(3);
			else
				Click(mainmenucontainer["plot_select"].holder["random_button"]);
				wait(3);
			end
		end

		if(mainmenucontainer.holder.AbsolutePosition.Y < 100 and mainMenuDone and not jobSelectDone) then
			Click(plrgui.screens["job_selection"].holder["select_button"]);
			jobSelectDone = true;
			wait(3);
		end

		-- if(plrgui.popups["starter_pack"].background.container.exit.AbsolutePosition.Y > -100) then
		-- 	Click(plrgui.popups["starter_pack"].background.container.exit);
		-- end

		-- if(plrgui.popups["login_reward"].background.container["confirm_button"].AbsolutePosition.Y > 100) then
		-- 	Click(plrgui.popups["login_reward"].background.container["confirm_button"]);
		-- end
	end
--]]

    if(plrchr.UpperTorso.Transparency == 0) then
        plrchr:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-1213.05835, 8.25830269, -24.1128159, -0.000407375424, -7.29586276e-08, -0.99999994, -3.1481445e-08, 1, -7.29458094e-08, 0.99999994, 3.14517266e-08, -0.000407375424)
        wait()
        VIM:SendKeyEvent(true, "E", false, game);
        wait();
        VIM:SendKeyEvent(false, "E", false, game);
        wait(.5);
        plrchr:MoveTo(plrchr:WaitForChild("HumanoidRootPart").Position);
        wait(1);
    end
	
	if(#game:GetService("Workspace")["delivery_bags"]:GetChildren() <= 0) then
		serverHop();
	end
	
	if(not plrchr:FindFirstChild("delivery_bag") and jobSelectDone) then
		plrchr:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace")["delivery_bags"]:WaitForChild("delivery_bag").CFrame;
		wait(.1);
		VIM:SendKeyEvent(true, "E", false, game);
		wait(.1);
		VIM:SendKeyEvent(false, "E", false, game);
    elseif(plrchr:FindFirstChild("delivery_bag") and jobSelectDone) then
		plrchr:WaitForChild("HumanoidRootPart").CFrame = plrchr:WaitForChild("delivery_bag"):WaitForChild("house").Value:WaitForChild("complete_region").CFrame;
	end
	
	wait(.4);
end

game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        syn.queue_on_teleport("print('ok')")
    end
end)