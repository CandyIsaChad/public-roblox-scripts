local WindowHandle = {};

local function _if(bool, a, b)
	if bool then return a else return b end
end

function WindowHandle:Create(uiname, accentColor, scale)
	uiname = uiname or "Shine Library";
	accentColor = accentColor or Color3.fromRGB(255, 0, 255);
	scale = scale or 1

	if game.CoreGui:FindFirstChild("ShineLib") then
		game.CoreGui:FindFirstChild("ShineLib"):Destroy();
	end

	local textColor = _if((accentColor.R*255+accentColor.G*255+accentColor.B*255) / 3 > 100, Color3.new(0, 0, 0), Color3.new(1, 1, 1));

	local ShineLib = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local Sidebar = Instance.new("Frame")
	local SidebarCorner = Instance.new("UICorner")
	local TabsFrame = Instance.new("Frame")
	local TabsListLayout = Instance.new("UIListLayout")
	local UICorner = Instance.new("UICorner")
	local UIName = Instance.new("TextLabel")
	local UINameCorner = Instance.new("UICorner")
	local PagesFrame = Instance.new("Frame")
	local pages = Instance.new("Folder")
	local PagesFrameCorner = Instance.new("UICorner")
	local UIScale = Instance.new("UIScale")

	ShineLib.Name = "ShineLib"
	ShineLib.Parent = game.CoreGui
	ShineLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ShineLib.ResetOnSpawn = false

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = ShineLib
	MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	MainFrame.Position = UDim2.new(0.302752316, 0, 0.308771938, 0)
	MainFrame.Size = UDim2.new(0, 516, 0, 326)

	Sidebar.Name = "Sidebar"
	Sidebar.Parent = MainFrame
	Sidebar.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	Sidebar.BorderSizePixel = 0
	Sidebar.Position = UDim2.new(0.0116279069, 0, 0.125766873, 0)
	Sidebar.Size = UDim2.new(0, 100, 0, 280)

	SidebarCorner.CornerRadius = UDim.new(0, 5)
	SidebarCorner.Name = "SidebarCorner"
	SidebarCorner.Parent = Sidebar

	TabsFrame.Name = "TabsFrame"
	TabsFrame.Parent = Sidebar
	TabsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabsFrame.BackgroundTransparency = 1.000
	TabsFrame.Position = UDim2.new(0.0599999987, 0, 0.021428572, 0)
	TabsFrame.Size = UDim2.new(0, 88, 0, 268)

	TabsListLayout.Name = "TabsListLayout"
	TabsListLayout.Parent = TabsFrame
	TabsListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	TabsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TabsListLayout.Padding = UDim.new(0, 6)

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = MainFrame

	UIName.Name = "UIName"
	UIName.Parent = MainFrame
	UIName.BackgroundColor3 = accentColor
	UIName.Position = UDim2.new(0.0116279069, 0, 0.0184049085, 0)
	UIName.Size = UDim2.new(0, 504, 0, 29)
	UIName.Font = Enum.Font.Gotham
	UIName.Text = uiname
	UIName.TextColor3 = textColor
	UIName.TextSize = 14.000

	UINameCorner.CornerRadius = UDim.new(0, 5)
	UINameCorner.Name = "UINameCorner"
	UINameCorner.Parent = UIName

	PagesFrame.Name = "PagesFrame"
	PagesFrame.Parent = MainFrame
	PagesFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	PagesFrame.Position = UDim2.new(0.217054263, 0, 0.125766873, 0)
	PagesFrame.Size = UDim2.new(0, 398, 0, 280)

	pages.Name = "pages"
	pages.Parent = PagesFrame

	PagesFrameCorner.CornerRadius = UDim.new(0, 5)
	PagesFrameCorner.Name = "PagesFrameCorner"
	PagesFrameCorner.Parent = PagesFrame

	UIScale.Parent = MainFrame
	UIScale.Scale = scale



	local TabHandle = {}

	function TabHandle:AddTab(tabname)
		tabname = tabname or "Unnamed Tab";

		local newTab = Instance.new("TextButton")
		local newTabCorner = Instance.new("UICorner")
		local newPage = Instance.new("ScrollingFrame")
		local newPageListLayout = Instance.new("UIListLayout")
		local newPagePadding = Instance.new("UIPadding")

		newTab.Name = "newTab"
		newTab.Parent = TabsFrame
		newTab.BackgroundColor3 = accentColor
		newTab.Position = UDim2.new(0.0599999987, 0, 0.021428572, 0)
		newTab.Size = UDim2.new(0, 88, 0, 32)
		newTab.Font = Enum.Font.Gotham
		newTab.Text = tabname
		newTab.TextColor3 = textColor
		newTab.TextSize = 14.000
		newTab.TextWrapped = true

		newTabCorner.CornerRadius = UDim.new(0, 5)
		newTabCorner.Name = "newTabCorner"
		newTabCorner.Parent = newTab

		newPage.Name = "newPage"
		newPage.Parent = pages
		newPage.Active = true
		newPage.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
		newPage.BackgroundTransparency = 1.000
		newPage.BorderSizePixel = 0
		newPage.Size = UDim2.new(0, 398, 0, 280)
		newPage.ScrollBarThickness = 6
		newPage.Visible = false

		newPageListLayout.Name = "newPageListLayout"
		newPageListLayout.Parent = newPage
		newPageListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		newPageListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		newPageListLayout.Padding = UDim.new(0, 6)

		newPagePadding.Name = "newPagePadding"
		newPagePadding.Parent = newPage
		newPagePadding.PaddingBottom = UDim.new(0, 6)
		newPagePadding.PaddingLeft = UDim.new(0, 6)
		newPagePadding.PaddingRight = UDim.new(0, 12)
		newPagePadding.PaddingTop = UDim.new(0, 6)

		local ElementHandle = {};

		function ElementHandle:AddButton(name, callback)
			name = name or "Unnamed Button";
			callback = callback or function() end;

			local newButton = Instance.new("TextButton")
			local newButtonCorner = Instance.new("UICorner")

			newButton.Name = "newButton"
			newButton.Parent = newPage
			newButton.BackgroundColor3 = accentColor
			newButton.Position = UDim2.new(0.0201005023, 0, 0.021428572, 0)
			newButton.Size = UDim2.new(0, 379, 0, 50)
			newButton.Font = Enum.Font.Gotham
			newButton.Text = name
			newButton.TextColor3 = textColor
			newButton.TextSize = 14.000

			newButtonCorner.CornerRadius = UDim.new(0, 5)
			newButtonCorner.Name = "newButtonCorner"
			newButtonCorner.Parent = newButton

			newButton.MouseButton1Click:Connect(callback);
		end

		function ElementHandle:AddToggle(name, default, callback)
			name = name or "Unnamed Toggle";
			default = _if(type(default) == "boolean", default, false);
			callback = callback or function() end;

			local newToggle = Instance.new("TextButton")
			local newButtonCorner = Instance.new("UICorner")
			local toggleCircle = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local toggleInnerCircle = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
			local TextLabel = Instance.new("TextLabel")

			newToggle.Name = "newToggle"
			newToggle.Parent = newPage
			newToggle.BackgroundColor3 = accentColor
			newToggle.Position = UDim2.new(0.0201005023, 0, 0.021428572, 0)
			newToggle.Size = UDim2.new(0, 379, 0, 50)
			newToggle.ZIndex = 100
			newToggle.Font = Enum.Font.Gotham
			newToggle.Text = ""
			newToggle.TextColor3 = textColor
			newToggle.TextSize = 14.000
			newToggle.TextTransparency = 1.000

			newButtonCorner.CornerRadius = UDim.new(0, 5)
			newButtonCorner.Name = "newButtonCorner"
			newButtonCorner.Parent = newToggle

			toggleCircle.Name = "toggleCircle"
			toggleCircle.Parent = newToggle
			toggleCircle.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			toggleCircle.Position = UDim2.new(0, 11, 0, 11)
			toggleCircle.Size = UDim2.new(0, 39, 0, 28)

			UICorner.CornerRadius = UDim.new(10, 0)
			UICorner.Parent = toggleCircle

			UIAspectRatioConstraint.Parent = toggleCircle

			toggleInnerCircle.Name = "toggleInnerCircle"
			toggleInnerCircle.Parent = toggleCircle
			toggleInnerCircle.BackgroundColor3 = _if(default, Color3.new(1, 0, 1), Color3.fromRGB(26, 26, 26))
			toggleInnerCircle.Position = UDim2.new(0, 4, 0, 4)
			toggleInnerCircle.Size = UDim2.new(0, 20, 0, 20)

			UICorner_2.CornerRadius = UDim.new(10, 0)
			UICorner_2.Parent = toggleInnerCircle

			UIAspectRatioConstraint_2.Parent = toggleInnerCircle

			TextLabel.Parent = newToggle
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.Position = UDim2.new(0.137203172, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 325, 0, 49)
			TextLabel.Font = Enum.Font.Gotham
			TextLabel.Text = name
			TextLabel.TextColor3 = textColor
			TextLabel.TextSize = 14.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			local toggle = default;

			newToggle.MouseButton1Click:Connect(function()
				toggle = not toggle;
---@diagnostic disable-next-line: redundant-parameter
				callback(toggle);

				if (toggle) then
					game.TweenService:Create(toggleInnerCircle, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = accentColor;
					}):Play();
				else
					game.TweenService:Create(toggleInnerCircle, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(26, 26, 26);
					}):Play();
				end

			end)
		end

		function ElementHandle:AddLabel(name)
			name = name or "";

			local newLabel = Instance.new("TextLabel")
			local newLabelCorner = Instance.new("UICorner")

			newLabel.Name = "newLabel"
			newLabel.Parent = newPage
			newLabel.BackgroundColor3 = accentColor
			newLabel.Size = UDim2.new(0, 379, 0, 50)
			newLabel.Font = Enum.Font.Gotham
			newLabel.Text = name
			newLabel.TextColor3 = textColor
			newLabel.TextSize = 14.000

			newLabelCorner.CornerRadius = UDim.new(0, 5)
			newLabelCorner.Name = "newLabelCorner"
			newLabelCorner.Parent = newLabel

		end

		newTab.MouseButton1Click:Connect(function()
			for _, v in next, pages:GetChildren() do
				v.Visible = false;
			end
			newPage.Visible = true;

			for _, v in next, TabsFrame:GetChildren() do
				if v:IsA("TextButton") then
					game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = _if(textColor.R ~= 1, Color3.new(_if(accentColor.R-0.5 >= 0, accentColor.R-0.5, 0), _if(accentColor.G-0.5 >= 0, accentColor.G-0.5, 0), _if(accentColor.B-0.5 >= 0, accentColor.B-0.5, 0)), Color3.new(_if(accentColor.R+0.5 <= 1, accentColor.R+0.5, 1), _if(accentColor.G+0.5 <= 1, accentColor.G+0.5, 1), _if(accentColor.B+0.5 <= 1, accentColor.B+0.5, 1)));
					}):Play();
				end
			end

			game.TweenService:Create(newTab, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				BackgroundColor3 = accentColor;
			}):Play();

		end)

		return ElementHandle;
	end

	function TabHandle:Destroy()
		game.CoreGui:FindFirstChild("ShineLib"):Destroy();
	end

	function TabHandle:ToggleUI()
		ShineLib.Enabled = not ShineLib.Enabled;
	end

	local UserInputService = game:GetService("UserInputService")

	local gui = MainFrame

	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
					
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	return TabHandle;
end

return WindowHandle;
