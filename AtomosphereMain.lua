local Atomos = {}
local TabCount = 0
local TS = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Mouse = game.Players.LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")

if game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.001) then
	game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.001):Destroy()
endlocal Atomos = {}
local TabCount = 0
local TS = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Mouse = game.Players.LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")

if game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.001) then
	game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.001):Destroy()
end
--[[

[Index]
▾AtomosCore
	▾Atomosphere Main
		▾AtomosTab
			▸Normal Button
			▸Toggle
			▸Keybind Button
			▸Slider




]]

--[[1›Atomos Core]]
local function CreateMain() --[[Atomosphere Main ›]]
	local Atomosphere = Instance.new("ScreenGui")
	Atomosphere.Name = "Atomosphere"
	Atomosphere.Parent = game:GetService("CoreGui")
end
CreateMain()
--‹

if getgenv().Ver == true then
	print("0.99.1b")
end

--[[AtomosTab› ]]
function Atomos:NewTab(Name) --[[AtomosTab› ]]
	local Main = game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.01)
	local CVD = false
	TabCount = TabCount + 1
	-------------------------------------------------------------------------------------------------
	--Create Tab
	local Tab = Instance.new("ImageLabel")
	local ButtonListing = Instance.new("UIListLayout")
	local MaxMinSize = Instance.new("UISizeConstraint")
	local TabTitle = Instance.new("TextLabel")
	local Close = Instance.new("ImageButton")
	local Open = Instance.new("ImageButton")
	local Corner = Instance.new("UICorner")
	Close.Image = "http://www.roblox.com/asset/?id=6672522633"
	Tab.Image = "http://www.roblox.com/asset/?id=6657363591"
	Open.Image = "http://www.roblox.com/asset/?id=6672528304"
	Tab.Name = Name or "Tab".. TabCount
	Tab.Parent = Main
	Tab.BackgroundColor3 = Color3.fromRGB(22, 25, 35)
	Tab.BorderSizePixel = 0
	Tab.LayoutOrder = 5
	Tab.Position = UDim2.new(0.0173761956, 0, 0.0284167733, 0)
	Tab.Size = UDim2.new(0.130321458, 0, 0.033829499, 0)
	Tab.ZIndex = 20
	Tab.BackgroundTransparency = 1
	ButtonListing.Name = "ButtonListing"
	ButtonListing.Parent = Tab
	ButtonListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ButtonListing.SortOrder = Enum.SortOrder.LayoutOrder
	MaxMinSize.Name = "MaxMinSize"
	MaxMinSize.Parent = Tab
	MaxMinSize.MaxSize = Vector2.new(150, math.huge)
	MaxMinSize.MinSize = Vector2.new(125, 0)
	TabTitle.Name = "TabTitle"
	TabTitle.Parent = Tab
	TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabTitle.BackgroundTransparency = 1.000
	TabTitle.Position = UDim2.new(0.13333334, 0, 0, 0)
	TabTitle.Size = UDim2.new(0.707, 0, 1, 0)
	TabTitle.ZIndex = 21
	TabTitle.Font = Enum.Font.Highway
	TabTitle.Text = Name or "NewTab".. TabCount
	TabTitle.TextColor3 = Color3.fromRGB(188, 189, 208)
	TabTitle.TextSize = 25.000
	TabTitle.TextScaled = true
	Close.Name = "Close"
	Close.Parent = TabTitle
	Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Close.BackgroundTransparency = 1.000
	Close.Position = UDim2.new(0.954545021, 0, 0, 0)
	Close.Size = UDim2.new(0.227272734, 0, 1, 0)
	Close.ZIndex = 23
	Close.AutoButtonColor = false
	Close.ScaleType = Enum.ScaleType.Fit
	Open.Name = "Open"
	Open.Parent = TabTitle
	Open.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Open.BackgroundTransparency = 1.000
	Open.Position = UDim2.new(0.954545021, 0, 0, 0)
	Open.Size = UDim2.new(0.227272734, 0, 1, 0)
	Open.ZIndex = 22
	Open.AutoButtonColor = false
	Open.ImageTransparency = 1
	Open.ScaleType = Enum.ScaleType.Fit
	Corner.CornerRadius = UDim.new(0, 0)
	Corner.Name = "Corner"
	Corner.Parent = Tab
	-------------------------------------------------------------------------------------------------
	--Draggable
	local dragging
	local dragInput
	local dragStart
	local startPos
	local function update(input)
		local delta = input.Position - dragStart
		Tab = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	Tab.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Tab.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	Tab.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
	-------------------------------------------------------------------------------------------------
	if TabCount > 1 then
		local Move = (game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.05):GetChildren()[TabCount - 1].Position.X.Scale + 0.1513)
		Tab.Position = UDim2.new(Move, 0, 0.0284167733, 0)
	end
	Close.MouseButton1Click:Connect(function()
		if not CVD then
			local Clicked = TS:Create(TabTitle, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 238, 249)})
			Clicked:Play()
			local ButtonClick = TS:Create(Close, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(229, 254, 255)})
			ButtonClick:Play()
			ButtonClick.Completed:Connect(function()
				TS:Create(Close, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			end)
			local Contract = TS:Create(ButtonListing, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Padding = UDim.new(-1,0)})
			Contract:Play()
			Contract.Completed:Connect(function()
				for _,v in pairs(Tab:GetChildren()) do
					if v:IsA("TextButton") then
						v.Visible = false
					end
				end
				local CornerOne = TS:Create(Corner, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {CornerRadius = UDim.new(0.5, 0)})
				CornerOne:Play()
				local HideMinimize = TS:Create(Close, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {ImageTransparency = 1})
				HideMinimize:Play()
				HideMinimize.Completed:Connect(function()
					Close.ZIndex = 22
					local ShowMaximize = TS:Create(Open, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0})
					ShowMaximize:Play()
					ShowMaximize.Completed:Connect(function()
						Open.ZIndex = 23
						CVD = true
					end)
				end)
			end)
		end
	end)
	
	Open.MouseButton1Click:Connect(function()
		if CVD then
			local Clicked = TS:Create(TabTitle, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(188, 189, 208)})
			Clicked:Play()
			local ButtonClick = TS:Create(Open, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(229, 254, 255)})
			ButtonClick:Play()
			ButtonClick.Completed:Connect(function()
				TS:Create(Open, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			end)
			local CornerZero = TS:Create(Corner, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {CornerRadius = UDim.new(0, 0)})
			CornerZero:Play()
			CornerZero.Completed:Connect(function()
				for _,v in pairs(Tab:GetChildren()) do
					if v:IsA("TextButton") then
						v.Visible = true
					end
				end
				local SlideDown = TS:Create(ButtonListing, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Padding = UDim.new(0,0)})
				SlideDown:Play()
				local HideMaximize = TS:Create(Open, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageTransparency = 1})
				HideMaximize:Play()
				HideMaximize.Completed:Connect(function()
					Open.ZIndex = 22
					local ShowMinimize = TS:Create(Close, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0})
					ShowMinimize:Play()
					ShowMinimize.Completed:Connect(function()
						Close.ZIndex = 23
						CVD = false
					end)
				end)
			end)
		end
	end)
	local ElementsList = {}
	
	
	function ElementsList:Button(str, callback) --[[Normal Button› ]]
		local Button = Instance.new("TextButton")
		local Icon = Instance.new("ImageLabel")
		Icon.Image = "http://www.roblox.com/asset/?id=6671933955"
		Tab.BackgroundTransparency = 0 --Make the dark top part visible
		--str
		Button.Name = str or "ClickButton"
		Button.Parent = Tab
		Button.BackgroundColor3 = Color3.fromRGB(22, 25, 35)
		Button.BorderSizePixel = 0
		Button.Position = UDim2.new(0, 0, 1.00000012, 0)
		Button.Size = UDim2.new(1, 0, 1, 0)
		Button.AutoButtonColor = false
		Button.ZIndex = 8
		Button.Font = Enum.Font.Highway
		Button.Text = str or "NewButton"
		Button.TextColor3 = Color3.fromRGB(188, 189, 208)
		Button.TextSize = 20.000
		Button.TextWrapped = true
		Icon.Name = "Icon"
		Icon.Parent = Button
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(0.833333015, 0, 0.12987946, 0)
		Icon.Size = UDim2.new(0.159999996, 0, 0.839999974, 0)
		Icon.ZIndex = 9
		Icon.ImageTransparency = 0.200
		Icon.ScaleType = Enum.ScaleType.Fit
		--Callback
		Button.MouseButton1Click:Connect(function()
			local s, f = pcall(callback)
			if f then
				print("UserError: ", f)
			end
			local Clicked = TS:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 238, 249)})
			local Return = TS:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(188, 189, 208)})
			local IconClicked = TS:Create(Icon, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0})
			local IconReturn = TS:Create(Icon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.200})
			Clicked:Play()
			IconClicked:Play()
			Clicked.Completed:Connect(function()
			wait(0.1)
			IconReturn:Play()
			Return:Play()
			end)
		end)
		--Effect
		Button.MouseEnter:Connect(function()
			local Hover = TS:Create(Button, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26, 30, 42)})	
			Hover:Play()
		end)
		Button.MouseLeave:Connect(function()
			local Leeave = TS:Create(Button, TweenInfo.new(0.36, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(22, 25, 35)})	
			Leeave:Play()
		end)
		--
	end
	-- ‹
	
	function ElementsList:Toggle(str, callback) --[[Toggle› ]]
		local Switch = false
		local Toggle = Instance.new("TextButton")
		local Off = Instance.new("ImageLabel")
		local On = Instance.new("ImageLabel")
		Toggle.Name = "Toggle"
		Toggle.Parent = Tab
		Toggle.BackgroundColor3 = Color3.fromRGB(22, 25, 35)
		Toggle.BorderSizePixel = 0
		Toggle.Position = UDim2.new(0, 0, 1, 0)
		Toggle.Size = UDim2.new(1, 0, 1, 0)
		Toggle.AutoButtonColor = false
		Toggle.Font = Enum.Font.Highway
		Toggle.Text = "Toggle"
		Toggle.TextColor3 = Color3.fromRGB(188, 189, 208)
		Toggle.TextSize = 20.000
		Toggle.TextWrapped = true
		Toggle.ZIndex = 8
		Off.Name = "Toggle"
		Off.Parent = Toggle
		Off.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Off.BackgroundTransparency = 1.000
		Off.Position = UDim2.new(0.839999914, 0, 0.0498793125, 0)
		Off.Size = UDim2.new(0.139615685, 0, 0.830120921, 0)
		Off.Image = "http://www.roblox.com/asset/?id=6675356457"
		Off.ImageTransparency = 0.200
		Off.ScaleType = Enum.ScaleType.Fit
		Off.ZIndex = 9
		On.Name = "On"
		On.Parent = Toggle
		On.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		On.BackgroundTransparency = 1.000
		On.BorderSizePixel = 0
		On.Position = UDim2.new(0.839999914, 0, 0.0498793125, 0)
		On.Size = UDim2.new(0.139615685, 0, 0.830120921, 0)
		On.Image = "http://www.roblox.com/asset/?id=6675344351"
		On.ScaleType = Enum.ScaleType.Fit
		On.ImageTransparency = 1
		On.ZIndex = 10
		--Effects
		--Button
		Toggle.MouseEnter:Connect(function()
			local Hover = TS:Create(Toggle, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26, 30, 42)})	
			Hover:Play()
		end)
		Toggle.MouseLeave:Connect(function()
			local Leeave = TS:Create(Toggle, TweenInfo.new(0.36, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(22, 25, 35)})	
			Leeave:Play()
		end)
		--Callback
		Toggle.MouseButton1Click:Connect(function()
			if not Switch then
				local OnVis = TS:Create(On, TweenInfo.new(0.35, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {ImageTransparency = 0})
				local OffT = TS:Create(Off, TweenInfo.new(0.35, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {ImageTransparency = 0})
				local Clicked = TS:Create(Toggle, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 238, 249)})
				OnVis:Play()
				OffT:Play()
				Clicked:Play()
			else
				local Clicked = TS:Create(Toggle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(188, 189, 208)})
				local OnVis = TS:Create(On, TweenInfo.new(0.35, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {ImageTransparency = 1})
				local OffT = TS:Create(Off, TweenInfo.new(0.35, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {ImageTransparency = 0.2})
				Clicked:Play()
				OnVis:Play()
				OffT:Play()
			end
			Switch = not Switch
			pcall(callback, Switch)
		end)
	end
	-- ‹
	
	function ElementsList:KeyButton(str, key, change, callback) --[[Keybind Button› ]]
		local KeyButton = Instance.new("TextButton")
		local Icon = Instance.new("ImageLabel")
		Icon.Image = "http://www.roblox.com/asset/?id=6672097066"
		KeyButton.Name = str or "KeyButton"
		KeyButton.Parent = Tab
		KeyButton.BackgroundColor3 = Color3.fromRGB(22, 25, 35)
		KeyButton.BorderSizePixel = 0
		KeyButton.Position = UDim2.new(0, 0, 1.00000012, 0)
		KeyButton.Size = UDim2.new(1, 0, 1, 0)
		KeyButton.AutoButtonColor = false
		KeyButton.ZIndex = 8
		KeyButton.Font = Enum.Font.Highway
		KeyButton.Text = str or "KeyButton"
		KeyButton.TextColor3 = Color3.fromRGB(188, 189, 208)
		KeyButton.TextSize = 20.000
		KeyButton.TextWrapped = true
		Icon.Name = "Icon"
		Icon.Parent = KeyButton
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(0.833333015, 0, -0.0800001025, 0)
		Icon.Size = UDim2.new(0.173333541, 0, 1.12000012, 0)
		Icon.ImageTransparency = 0.200
		Icon.ZIndex = 9
		Icon.ScaleType = Enum.ScaleType.Fit
		local KeyBind = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")
		local Detector = Instance.new("Frame")
		local Changing = false
		if key then
		key = key:sub(1,1):upper() .. key:sub(2)
		if key == "Rightalt" or "Leftalt" then
			key = string.gsub(tostring(key), "alt", "Alt")
		elseif key == "Rightshift" or "Leftshift" then
		key = string.gsub(tostring(key), "shift", "Shift")
		end
		end
		KeyBind.Name = key or ""
		KeyBind.Parent = KeyButton
		KeyBind.BackgroundColor3 = Color3.fromRGB(40, 42, 54)
		KeyBind.BorderSizePixel = 0
		KeyBind.LayoutOrder = -3
		KeyBind.Position = UDim2.new(0.659, 0, 0, 0)
		KeyBind.Size = UDim2.new(0.330563664, 0, 1, 0)
		KeyBind.AutoButtonColor = false
		KeyBind.ZIndex = 1
		KeyBind.Font = Enum.Font.Highway
		KeyBind.Text = key or ""
		KeyBind.TextColor3 = Color3.fromRGB(172, 172, 172)
		KeyBind.TextSize = 12.000
		KeyBind.TextWrapped = true
		Detector.Name = "Detector"
		Detector.Parent = KeyButton
		Detector.BackgroundColor3 = Color3.fromRGB(40, 42, 54)
		Detector.BackgroundTransparency = 1.000
		Detector.Size = UDim2.new(1.33333337, 0, 1, 0)
		Detector.ZIndex = 0
		UICorner.CornerRadius = UDim.new(0.200000003, 0)
		UICorner.Parent = KeyBind
		--Callback
			--KeyBind Change
		if change == true then
			KeyBind.MouseButton1Click:Connect(function()
			local Clicked = TS:Create(KeyBind, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 238, 249)})
			local Return = TS:Create(KeyBind, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(188, 189, 208)})
			KeyBind.Text = "[...]"
			Changing = true
			Clicked:Play()
			Clicked.Completed:Connect(function(playbackState)
				wait(0.1)
				Return:Play()
			end)
			UserInputService.InputBegan:Connect(function(Input , GPE)
			if Changing then
			KeyBind.Text = string.sub(tostring(Input.KeyCode), 14)
			key = string.sub(tostring(Input.KeyCode), 14)
			Changing = false
			Clicked:Play()
			Clicked.Completed:Connect(function()
			wait(0.1)
			Return:Play()
			end)
			end
			end)
		end)	
		end
			--KeyBind Fire
		if key then
		UserInputService.InputBegan:Connect(function(input, gp) -- when player presses a key
			if input.KeyCode == Enum.KeyCode[key] and not gp and not Changing then
			spawn(function()
				local IconClicked = TS:Create(Icon, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0})
				local IconReturn = TS:Create(Icon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.200})
				local Clicked = TS:Create(KeyButton, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 238, 249)})
				local Return = TS:Create(KeyButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(188, 189, 208)})
				Clicked:Play()
				IconClicked:Play()
				Clicked.Completed:Connect(function(playbackState)
				wait(0.1)
				IconReturn:Play()
				Return:Play()
				end)
			end)
			
				local s, f = pcall(callback)
				if f then
					print("UserError: ", f)
				end
			end
			end)
		end
			--Button
		KeyButton.MouseButton1Click:Connect(function()
			local s, f = pcall(callback)
			if f then
				print("UserError: ", f)
			end
			local IconClicked = TS:Create(Icon, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0})
			local IconReturn = TS:Create(Icon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.200})
			local Clicked = TS:Create(KeyButton, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 238, 249)})
			local Return = TS:Create(KeyButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(188, 189, 208)})
			Clicked:Play()
			IconClicked:Play()
			Clicked.Completed:Connect(function(playbackState)
			wait(0.1)
			IconReturn:Play()
			Return:Play()
			end)
		end)
		--
		--Effect
			--Button
		KeyButton.MouseEnter:Connect(function()
			local Hover = TS:Create(KeyButton, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26, 30, 42)})	
			Hover:Play()
			local SlideOut = TS:Create(KeyBind, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, 0, 0, 0)})
			SlideOut:Play()
		end)
		KeyButton.MouseLeave:Connect(function()
			local Leave = TS:Create(KeyButton, TweenInfo.new(0.36, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(22, 25, 35)})	
			Leave:Play()
		end)
			--KeyBind
		KeyBind.MouseEnter:Connect(function()
			local Hover = TS:Create(KeyBind, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(35, 37, 48)})	
			Hover:Play()
		end)
		KeyBind.MouseLeave:Connect(function()
			local Leave = TS:Create(KeyBind, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(40, 42, 54)})	
			Leave:Play()
		end)
			--Detector
		Detector.MouseLeave:Connect(function()
			local Leave = TS:Create(KeyBind, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(40, 42, 54)})	
			Leave:Play()
			
			local SlideIn = TS:Create(KeyBind, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {Position = UDim2.new(0.659, 0, 0, 0)})
			SlideIn:Play()
		end)
		--
	end
	-- ‹
	
	function ElementsList:Slider(str, min, max, def, callback) --[[Slider› ]]
		local dragging = false
		local Slider = Instance.new("TextButton")
		local Detector = Instance.new("Frame")
		local SliderBG = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local SliderLine = Instance.new("Frame")
		local SliderDrag = Instance.new("ImageButton")
		local ValueBG = Instance.new("ImageLabel")
		local SliderText = Instance.new("TextLabel")
		local Container = Instance.new("Frame")
		local DragCons = Instance.new("UIAspectRatioConstraint")
		local Icon = Instance.new("ImageLabel")
		SliderDrag.Image = "http://www.roblox.com/asset/?id=6661762894"
		ValueBG.Image = "http://www.roblox.com/asset/?id=6661850089"
		Icon.Image = "http://www.roblox.com/asset/?id=6672257305"
		Slider.Name = str or "DragSlider"
		Slider.Parent = Tab
		Slider.BackgroundColor3 = Color3.fromRGB(22, 25, 35)
		Slider.BorderSizePixel = 0
		Slider.Position = UDim2.new(0, 0, 1.00000012, 0)
		Slider.Size = UDim2.new(1, 0, 1, 0)
		Slider.AutoButtonColor = false
		Slider.ZIndex = 8
		Slider.Font = Enum.Font.Highway
		Slider.Text = str or "DragSlider"
		Slider.TextColor3 = Color3.fromRGB(188, 189, 208)
		Slider.TextSize = 20.000
		Slider.TextWrapped = true
		Detector.Name = "Detector"
		Detector.Parent = Slider
		Detector.BackgroundColor3 = Color3.fromRGB(40, 42, 54)
		Detector.BackgroundTransparency = 1.000
		Detector.Size = UDim2.new(2.07294893, 0, 1, 0)
		Detector.ZIndex = 0
		SliderBG.Name = "SliderBG"
		SliderBG.Parent = Slider
		SliderBG.BackgroundColor3 = Color3.fromRGB(40, 42, 54)
		SliderBG.Position = UDim2.new(0.053, 0, 0, 0)
		SliderBG.Size = UDim2.new(0.946282327, 0, 1, 0)
		SliderBG.ZIndex = 1
		UICorner.CornerRadius = UDim.new(0.200000003, 0)
		UICorner.Parent = SliderBG
		SliderLine.Name = "SliderLine"
		SliderLine.Parent = SliderBG
		SliderLine.BackgroundColor3 = Color3.fromRGB(255, 20, 55)
		SliderLine.BorderSizePixel = 0
		SliderLine.Position = UDim2.new(0.0623763539, 0, 0.479999989, 0)
		SliderLine.Size = UDim2.new(0.866338253, 0, 0.0799999982, 0)
		SliderLine.ZIndex = 2
		SliderDrag.Name = "SliderDrag"
		SliderDrag.Parent = SliderLine
		SliderDrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SliderDrag.BackgroundTransparency = 1.000
		SliderDrag.BorderSizePixel = 0
		SliderDrag.Position = UDim2.new(-0.0801321045, 0, -4.5, 0)
		SliderDrag.Size = UDim2.new(0.168660358, 0, 10, 0)
		SliderDrag.ZIndex = 3
		SliderDrag.AutoButtonColor = false
		SliderDrag.ScaleType = Enum.ScaleType.Fit
		Container.Name = "Container"
		Container.Parent = SliderDrag
		Container.BackgroundColor3 = Color3.fromRGB(40, 42, 54)
		Container.BackgroundTransparency = 1.000
		Container.Position = UDim2.new(-0.240999997, 0, -1.20000005, 0)
		Container.Size = UDim2.new(1.44599998, 0, 1.25, 0)
		Container.ZIndex = 1
		Container.ClipsDescendants = true
		ValueBG.Name = "ValueBG"
		ValueBG.Parent = Container
		ValueBG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ValueBG.BackgroundTransparency = 1.000
		ValueBG.BorderSizePixel = 0
		ValueBG.ClipsDescendants = true
		ValueBG.Position = UDim2.new(-0.100355983, 0, 1, 0)
		ValueBG.Size = UDim2.new(1.20038807, 0, 1.00999999, 0)
		ValueBG.ZIndex = 6
		ValueBG.ScaleType = Enum.ScaleType.Fit
		SliderText.Name = "SliderText"
		SliderText.Parent = ValueBG
		SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SliderText.BackgroundTransparency = 1.000
		SliderText.Position = UDim2.new(0, 0, 0.0799999982, 0)
		SliderText.Size = UDim2.new(1, 0, 0.479999989, 0)
		SliderText.ZIndex = 7
		SliderText.Font = Enum.Font.Highway
		SliderText.Text = ""
		SliderText.TextColor3 = Color3.fromRGB(200, 203, 231)
		SliderText.TextScaled = true
		SliderText.TextSize = 15.000
		SliderText.TextWrapped = true
		Icon.Name = "Icon"
		Icon.Parent = Slider
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(0.833333015, 0, 0.12987946, 0)
		Icon.Size = UDim2.new(0.159999996, 0, 0.839999974, 0)
		Icon.ZIndex = 9
		Icon.ImageTransparency = 0.200
		Icon.ScaleType = Enum.ScaleType.Fit
		DragCons.Name = "DragCons"
		DragCons.Parent = SliderDrag
		DragCons.AspectRatio = 1.037
		--Effect
		--Slider
		Slider.MouseEnter:Connect(function()
			local Hover = TS:Create(Slider, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26, 30, 42)})	
			Hover:Play()
			local SlideOut = TS:Create(SliderBG, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {Position = UDim2.new(1, 0, 0, 0)})
			SlideOut:Play()
		end)
		Slider.MouseLeave:Connect(function()
			local Leave = TS:Create(Slider, TweenInfo.new(0.36, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(22, 25, 35)})	
			Leave:Play()
		end)
		--Detector
		Detector.MouseLeave:Connect(function()
			local SlideIn = TS:Create(SliderBG, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {Position = UDim2.new(0.053, 0, 0, 0)})
			SlideIn:Play()
			local Leave = TS:Create(SliderBG, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(40, 42, 54)})	
			Leave:Play()
			local Hide = TS:Create(ValueBG, TweenInfo.new(0.36, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(-0.100355983, 0, 1, 0)})
			Hide:Play()
		end)
		--SliderBG
		SliderBG.MouseEnter:Connect(function()
			local Hover = TS:Create(SliderBG, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(35, 37, 48)})	
			Hover:Play()
		end)
		SliderBG.MouseLeave:Connect(function()
			local Leave = TS:Create(SliderBG, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(40, 42, 54)})	
			Leave:Play()
		end)
		--SliderDrag
		SliderDrag.MouseEnter:Connect(function()
			local Show = TS:Create(ValueBG, TweenInfo.new(0.33, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Position = UDim2.new(-0.100355983, 0, 0, 0)})
			Show:Play()
		end)
		SliderDrag.MouseLeave:Connect(function()
			if not dragging then
			local Hide = TS:Create(ValueBG, TweenInfo.new(0.36, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(-0.100355983, 0, 1, 0)})
			Hide:Play()
			end
		end)
		--
		--Callback
		if min and max and def and callback then
		SliderText.Text = tostring(def)
		local function move(input)
			local pos = UDim2.new(math.clamp((input.Position.X - SliderLine.AbsolutePosition.X) / SliderLine.AbsoluteSize.X, 0, 1), -10.2,-4.4,0)
			SliderDrag:TweenPosition(pos, "Out", "Quad", 0.36, true)
			local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
			SliderText.Text = tostring(value)
			pcall(callback, value)
		end
		SliderDrag.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
				local function Two()
				local DraggingOn = TS:Create(SliderLine, TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 178, 178)})
				local DraggingOnT = TS:Create(SliderLine, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.4})
				local IconClicked = TS:Create(Icon, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0})
				DraggingOn:Play()
				DraggingOnT:Play()	
				IconClicked:Play()	
				end	
				local function One()
				local Show = TS:Create(ValueBG, TweenInfo.new(0.23, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(-0.100355983, 0, 0, 0)})
				local Change = TS:Create(ValueBG, TweenInfo.new(0.36, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(129, 255, 234)})
				Show:Play()	
				wait(0.05)
				Change:Play()
				end	
				local onecoro, twocoro = coroutine.create(One), coroutine.create(Two)
				coroutine.resume(onecoro)
				coroutine.resume(twocoro)
			end
		end)
		SliderDrag.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = false
				local function Two()
				local DraggingOff = TS:Create(SliderLine, TweenInfo.new(0.36, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(255, 20, 25)})
				local DraggingOffT = TS:Create(SliderLine, TweenInfo.new(0.36, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 0})
				local IconReturn = TS:Create(Icon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.200})	
				DraggingOff:Play()
				DraggingOffT:Play()	
				IconReturn:Play()
				end
				local function One()
				local Hide = TS:Create(ValueBG, TweenInfo.new(0.36, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(-0.100355983, 0, 1, 0)})
				local Revert = TS:Create(ValueBG, TweenInfo.new(0.36, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				Revert:Play()	
				wait(0.15)
				Hide:Play()
				end
				local onecoro, twocoro = coroutine.create(One), coroutine.create(Two)
				coroutine.resume(onecoro)
				coroutine.resume(twocoro)
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
				move(input)
			end
			end)
		end
		
	end
	-- ‹
	
	return ElementsList
end
return Atomos;
--[[

[Index]
▾AtomosCore
	▾Atomosphere Main
		▾AtomosTab
			▸Normal Button
			▸Toggle
			▸Keybind Button
			▸Slider




]]

--[[1›Atomos Core]]
local function CreateMain() --[[Atomosphere Main ›]]
	local Atomosphere = Instance.new("ScreenGui")
	Atomosphere.Name = "Atomosphere"
	Atomosphere.Parent = game:GetService("CoreGui")
end
CreateMain()
--‹

if getgenv().Ver == true then
	print("0.99b")
end

--[[AtomosTab› ]]
function Atomos:NewTab(Name) --[[AtomosTab› ]]
	local Main = game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.01)
	local CVD = false
	TabCount = TabCount + 1
	-------------------------------------------------------------------------------------------------
	--Create Tab
	local Tab = Instance.new("ImageLabel")
	local ButtonListing = Instance.new("UIListLayout")
	local MaxMinSize = Instance.new("UISizeConstraint")
	local TabTitle = Instance.new("TextLabel")
	local Close = Instance.new("ImageButton")
	local Open = Instance.new("ImageButton")
	local Corner = Instance.new("UICorner")
	-------------------------------------------------------------------------------------------------
	--Draggable
	local dragging
	local dragInput
	local dragStart
	local startPos
	local function update(input)
		local delta = input.Position - dragStart
		Tab = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	Tab.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Tab.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	Tab.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
	-------------------------------------------------------------------------------------------------
	Close.Image = "http://www.roblox.com/asset/?id=6672522633"
	Tab.Image = "http://www.roblox.com/asset/?id=6657363591"
	Open.Image = "http://www.roblox.com/asset/?id=6672528304"
	Tab.Name = Name or "Tab".. TabCount
	Tab.Parent = Main
	Tab.BackgroundColor3 = Color3.fromRGB(22, 25, 35)
	Tab.BorderSizePixel = 0
	Tab.LayoutOrder = 5
	Tab.Position = UDim2.new(0.0173761956, 0, 0.0284167733, 0)
	Tab.Size = UDim2.new(0.130321458, 0, 0.033829499, 0)
	Tab.ZIndex = 20
	Tab.BackgroundTransparency = 1
	ButtonListing.Name = "ButtonListing"
	ButtonListing.Parent = Tab
	ButtonListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ButtonListing.SortOrder = Enum.SortOrder.LayoutOrder
	MaxMinSize.Name = "MaxMinSize"
	MaxMinSize.Parent = Tab
	MaxMinSize.MaxSize = Vector2.new(150, math.huge)
	MaxMinSize.MinSize = Vector2.new(125, 0)
	TabTitle.Name = "TabTitle"
	TabTitle.Parent = Tab
	TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabTitle.BackgroundTransparency = 1.000
	TabTitle.Position = UDim2.new(0.13333334, 0, 0, 0)
	TabTitle.Size = UDim2.new(0.707, 0, 1, 0)
	TabTitle.ZIndex = 21
	TabTitle.Font = Enum.Font.Highway
	TabTitle.Text = Name or "NewTab".. TabCount
	TabTitle.TextColor3 = Color3.fromRGB(188, 189, 208)
	TabTitle.TextSize = 25.000
	TabTitle.TextScaled = true
	Close.Name = "Close"
	Close.Parent = TabTitle
	Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Close.BackgroundTransparency = 1.000
	Close.Position = UDim2.new(0.954545021, 0, 0, 0)
	Close.Size = UDim2.new(0.227272734, 0, 1, 0)
	Close.ZIndex = 23
	Close.AutoButtonColor = false
	Close.ScaleType = Enum.ScaleType.Fit
	Open.Name = "Open"
	Open.Parent = TabTitle
	Open.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Open.BackgroundTransparency = 1.000
	Open.Position = UDim2.new(0.954545021, 0, 0, 0)
	Open.Size = UDim2.new(0.227272734, 0, 1, 0)
	Open.ZIndex = 22
	Open.AutoButtonColor = false
	Open.ImageTransparency = 1
	Open.ScaleType = Enum.ScaleType.Fit
	Corner.CornerRadius = UDim.new(0, 0)
	Corner.Name = "Corner"
	Corner.Parent = Tab
	if TabCount > 1 then
		local Move = (game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.05):GetChildren()[TabCount - 1].Position.X.Scale + 0.1513)
		Tab.Position = UDim2.new(Move, 0, 0.0284167733, 0)
	end
	Close.MouseButton1Click:Connect(function()
		if not CVD then
			local Clicked = TS:Create(TabTitle, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 238, 249)})
			Clicked:Play()
			local ButtonClick = TS:Create(Close, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(229, 254, 255)})
			ButtonClick:Play()
			ButtonClick.Completed:Connect(function()
				TS:Create(Close, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			end)
			local Contract = TS:Create(ButtonListing, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Padding = UDim.new(-1,0)})
			Contract:Play()
			Contract.Completed:Connect(function()
				for _,v in pairs(Tab:GetChildren()) do
					if v:IsA("TextButton") then
						v.Visible = false
					end
				end
				local CornerOne = TS:Create(Corner, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {CornerRadius = UDim.new(0.5, 0)})
				CornerOne:Play()
				local HideMinimize = TS:Create(Close, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {ImageTransparency = 1})
				HideMinimize:Play()
				HideMinimize.Completed:Connect(function()
					Close.ZIndex = 22
					local ShowMaximize = TS:Create(Open, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0})
					ShowMaximize:Play()
					ShowMaximize.Completed:Connect(function()
						Open.ZIndex = 23
						CVD = true
					end)
				end)
			end)
		end
	end)
	
	Open.MouseButton1Click:Connect(function()
		if CVD then
			local Clicked = TS:Create(TabTitle, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(188, 189, 208)})
			Clicked:Play()
			local ButtonClick = TS:Create(Open, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(229, 254, 255)})
			ButtonClick:Play()
			ButtonClick.Completed:Connect(function()
				TS:Create(Open, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			end)
			local CornerZero = TS:Create(Corner, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {CornerRadius = UDim.new(0, 0)})
			CornerZero:Play()
			CornerZero.Completed:Connect(function()
				for _,v in pairs(Tab:GetChildren()) do
					if v:IsA("TextButton") then
						v.Visible = true
					end
				end
				local SlideDown = TS:Create(ButtonListing, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Padding = UDim.new(0,0)})
				SlideDown:Play()
				local HideMaximize = TS:Create(Open, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageTransparency = 1})
				HideMaximize:Play()
				HideMaximize.Completed:Connect(function()
					Open.ZIndex = 22
					local ShowMinimize = TS:Create(Close, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0})
					ShowMinimize:Play()
					ShowMinimize.Completed:Connect(function()
						Close.ZIndex = 23
						CVD = false
					end)
				end)
			end)
		end
	end)
	local ElementsList = {}
	
	
	function ElementsList:Button(str, callback) --[[Normal Button› ]]
		local Button = Instance.new("TextButton")
		local Icon = Instance.new("ImageLabel")
		Icon.Image = "http://www.roblox.com/asset/?id=6671933955"
		Tab.BackgroundTransparency = 0 --Make the dark top part visible
		--str
		Button.Name = str or "ClickButton"
		Button.Parent = Tab
		Button.BackgroundColor3 = Color3.fromRGB(22, 25, 35)
		Button.BorderSizePixel = 0
		Button.Position = UDim2.new(0, 0, 1.00000012, 0)
		Button.Size = UDim2.new(1, 0, 1, 0)
		Button.AutoButtonColor = false
		Button.ZIndex = 8
		Button.Font = Enum.Font.Highway
		Button.Text = str or "NewButton"
		Button.TextColor3 = Color3.fromRGB(188, 189, 208)
		Button.TextSize = 20.000
		Button.TextWrapped = true
		Icon.Name = "Icon"
		Icon.Parent = Button
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(0.833333015, 0, 0.12987946, 0)
		Icon.Size = UDim2.new(0.159999996, 0, 0.839999974, 0)
		Icon.ZIndex = 9
		Icon.ImageTransparency = 0.200
		Icon.ScaleType = Enum.ScaleType.Fit
		--Callback
		Button.MouseButton1Click:Connect(function()
			local s, f = pcall(callback)
			if f then
				print("UserError: ", f)
			end
			local Clicked = TS:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 238, 249)})
			local Return = TS:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(188, 189, 208)})
			local IconClicked = TS:Create(Icon, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0})
			local IconReturn = TS:Create(Icon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.200})
			Clicked:Play()
			IconClicked:Play()
			Clicked.Completed:Connect(function()
			wait(0.1)
			IconReturn:Play()
			Return:Play()
			end)
		end)
		--Effect
		Button.MouseEnter:Connect(function()
			local Hover = TS:Create(Button, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26, 30, 42)})	
			Hover:Play()
		end)
		Button.MouseLeave:Connect(function()
			local Leeave = TS:Create(Button, TweenInfo.new(0.36, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(22, 25, 35)})	
			Leeave:Play()
		end)
		--
	end
	-- ‹
	
	function ElementsList:Toggle(str, callback) --[[Toggle› ]]
		local Switch = false
		local Toggle = Instance.new("TextButton")
		local Off = Instance.new("ImageLabel")
		local On = Instance.new("ImageLabel")
		Toggle.Name = "Toggle"
		Toggle.Parent = Tab
		Toggle.BackgroundColor3 = Color3.fromRGB(22, 25, 35)
		Toggle.BorderSizePixel = 0
		Toggle.Position = UDim2.new(0, 0, 1, 0)
		Toggle.Size = UDim2.new(1, 0, 1, 0)
		Toggle.AutoButtonColor = false
		Toggle.Font = Enum.Font.Highway
		Toggle.Text = "Toggle"
		Toggle.TextColor3 = Color3.fromRGB(188, 189, 208)
		Toggle.TextSize = 20.000
		Toggle.TextWrapped = true
		Toggle.ZIndex = 8
		Off.Name = "Toggle"
		Off.Parent = Toggle
		Off.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Off.BackgroundTransparency = 1.000
		Off.Position = UDim2.new(0.839999914, 0, 0.0498793125, 0)
		Off.Size = UDim2.new(0.139615685, 0, 0.830120921, 0)
		Off.Image = "http://www.roblox.com/asset/?id=6675356457"
		Off.ImageTransparency = 0.200
		Off.ScaleType = Enum.ScaleType.Fit
		Off.ZIndex = 9
		On.Name = "On"
		On.Parent = Toggle
		On.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		On.BackgroundTransparency = 1.000
		On.BorderSizePixel = 0
		On.Position = UDim2.new(0.839999914, 0, 0.0498793125, 0)
		On.Size = UDim2.new(0.139615685, 0, 0.830120921, 0)
		On.Image = "http://www.roblox.com/asset/?id=6675344351"
		On.ScaleType = Enum.ScaleType.Fit
		On.ImageTransparency = 1
		On.ZIndex = 10
		--Effects
		--Button
		Toggle.MouseEnter:Connect(function()
			local Hover = TS:Create(Toggle, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26, 30, 42)})	
			Hover:Play()
		end)
		Toggle.MouseLeave:Connect(function()
			local Leeave = TS:Create(Toggle, TweenInfo.new(0.36, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(22, 25, 35)})	
			Leeave:Play()
		end)
		--Callback
		Toggle.MouseButton1Click:Connect(function()
			if not Switch then
				local OnVis = TS:Create(On, TweenInfo.new(0.35, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {ImageTransparency = 0})
				local OffT = TS:Create(Off, TweenInfo.new(0.35, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {ImageTransparency = 0})
				local Clicked = TS:Create(Toggle, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 238, 249)})
				OnVis:Play()
				OffT:Play()
				Clicked:Play()
			else
				local Clicked = TS:Create(Toggle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(188, 189, 208)})
				local OnVis = TS:Create(On, TweenInfo.new(0.35, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {ImageTransparency = 1})
				local OffT = TS:Create(Off, TweenInfo.new(0.35, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {ImageTransparency = 0.2})
				Clicked:Play()
				OnVis:Play()
				OffT:Play()
			end
			Switch = not Switch
			pcall(callback, Switch)
		end)
	end
	-- ‹
	
	function ElementsList:KeyButton(str, key, change, callback) --[[Keybind Button› ]]
		local KeyButton = Instance.new("TextButton")
		local Icon = Instance.new("ImageLabel")
		Icon.Image = "http://www.roblox.com/asset/?id=6672097066"
		KeyButton.Name = str or "KeyButton"
		KeyButton.Parent = Tab
		KeyButton.BackgroundColor3 = Color3.fromRGB(22, 25, 35)
		KeyButton.BorderSizePixel = 0
		KeyButton.Position = UDim2.new(0, 0, 1.00000012, 0)
		KeyButton.Size = UDim2.new(1, 0, 1, 0)
		KeyButton.AutoButtonColor = false
		KeyButton.ZIndex = 8
		KeyButton.Font = Enum.Font.Highway
		KeyButton.Text = str or "KeyButton"
		KeyButton.TextColor3 = Color3.fromRGB(188, 189, 208)
		KeyButton.TextSize = 20.000
		KeyButton.TextWrapped = true
		Icon.Name = "Icon"
		Icon.Parent = KeyButton
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(0.833333015, 0, -0.0800001025, 0)
		Icon.Size = UDim2.new(0.173333541, 0, 1.12000012, 0)
		Icon.ImageTransparency = 0.200
		Icon.ZIndex = 9
		Icon.ScaleType = Enum.ScaleType.Fit
		local KeyBind = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")
		local Detector = Instance.new("Frame")
		local Changing = false
		if key then
		key = key:sub(1,1):upper() .. key:sub(2)
		if key == "Rightalt" or "Leftalt" then
			key = string.gsub(tostring(key), "alt", "Alt")
		elseif key == "Rightshift" or "Leftshift" then
		key = string.gsub(tostring(key), "shift", "Shift")
		end
		end
		KeyBind.Name = key or ""
		KeyBind.Parent = KeyButton
		KeyBind.BackgroundColor3 = Color3.fromRGB(40, 42, 54)
		KeyBind.BorderSizePixel = 0
		KeyBind.LayoutOrder = -3
		KeyBind.Position = UDim2.new(0.659, 0, 0, 0)
		KeyBind.Size = UDim2.new(0.330563664, 0, 1, 0)
		KeyBind.AutoButtonColor = false
		KeyBind.ZIndex = 1
		KeyBind.Font = Enum.Font.Highway
		KeyBind.Text = key or ""
		KeyBind.TextColor3 = Color3.fromRGB(172, 172, 172)
		KeyBind.TextSize = 12.000
		KeyBind.TextWrapped = true
		Detector.Name = "Detector"
		Detector.Parent = KeyButton
		Detector.BackgroundColor3 = Color3.fromRGB(40, 42, 54)
		Detector.BackgroundTransparency = 1.000
		Detector.Size = UDim2.new(1.33333337, 0, 1, 0)
		Detector.ZIndex = 0
		UICorner.CornerRadius = UDim.new(0.200000003, 0)
		UICorner.Parent = KeyBind
		--Callback
			--KeyBind Change
		if change == true then
			KeyBind.MouseButton1Click:Connect(function()
			local Clicked = TS:Create(KeyBind, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 238, 249)})
			local Return = TS:Create(KeyBind, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(188, 189, 208)})
			KeyBind.Text = "[...]"
			Changing = true
			Clicked:Play()
			Clicked.Completed:Connect(function(playbackState)
				wait(0.1)
				Return:Play()
			end)
			UserInputService.InputBegan:Connect(function(Input , GPE)
			if Changing then
			KeyBind.Text = string.sub(tostring(Input.KeyCode), 14)
			key = string.sub(tostring(Input.KeyCode), 14)
			Changing = false
			Clicked:Play()
			Clicked.Completed:Connect(function()
			wait(0.1)
			Return:Play()
			end)
			end
			end)
		end)	
		end
			--KeyBind Fire
		if key then
		UserInputService.InputBegan:Connect(function(input, gp) -- when player presses a key
			if input.KeyCode == Enum.KeyCode[key] and not gp and not Changing then
			spawn(function()
				local IconClicked = TS:Create(Icon, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0})
				local IconReturn = TS:Create(Icon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.200})
				local Clicked = TS:Create(KeyButton, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 238, 249)})
				local Return = TS:Create(KeyButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(188, 189, 208)})
				Clicked:Play()
				IconClicked:Play()
				Clicked.Completed:Connect(function(playbackState)
				wait(0.1)
				IconReturn:Play()
				Return:Play()
				end)
			end)
			
				local s, f = pcall(callback)
				if f then
					print("UserError: ", f)
				end
			end
			end)
		end
			--Button
		KeyButton.MouseButton1Click:Connect(function()
			local s, f = pcall(callback)
			if f then
				print("UserError: ", f)
			end
			local IconClicked = TS:Create(Icon, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0})
			local IconReturn = TS:Create(Icon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.200})
			local Clicked = TS:Create(KeyButton, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 238, 249)})
			local Return = TS:Create(KeyButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(188, 189, 208)})
			Clicked:Play()
			IconClicked:Play()
			Clicked.Completed:Connect(function(playbackState)
			wait(0.1)
			IconReturn:Play()
			Return:Play()
			end)
		end)
		--
		--Effect
			--Button
		KeyButton.MouseEnter:Connect(function()
			local Hover = TS:Create(KeyButton, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26, 30, 42)})	
			Hover:Play()
			local SlideOut = TS:Create(KeyBind, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, 0, 0, 0)})
			SlideOut:Play()
		end)
		KeyButton.MouseLeave:Connect(function()
			local Leave = TS:Create(KeyButton, TweenInfo.new(0.36, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(22, 25, 35)})	
			Leave:Play()
		end)
			--KeyBind
		KeyBind.MouseEnter:Connect(function()
			local Hover = TS:Create(KeyBind, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(35, 37, 48)})	
			Hover:Play()
		end)
		KeyBind.MouseLeave:Connect(function()
			local Leave = TS:Create(KeyBind, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(40, 42, 54)})	
			Leave:Play()
		end)
			--Detector
		Detector.MouseLeave:Connect(function()
			local Leave = TS:Create(KeyBind, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(40, 42, 54)})	
			Leave:Play()
			
			local SlideIn = TS:Create(KeyBind, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {Position = UDim2.new(0.659, 0, 0, 0)})
			SlideIn:Play()
		end)
		--
	end
	-- ‹
	
	function ElementsList:Slider(str, min, max, def, callback) --[[Slider› ]]
		local dragging = false
		local Slider = Instance.new("TextButton")
		local Detector = Instance.new("Frame")
		local SliderBG = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local SliderLine = Instance.new("Frame")
		local SliderDrag = Instance.new("ImageButton")
		local ValueBG = Instance.new("ImageLabel")
		local SliderText = Instance.new("TextLabel")
		local Container = Instance.new("Frame")
		local DragCons = Instance.new("UIAspectRatioConstraint")
		local Icon = Instance.new("ImageLabel")
		SliderDrag.Image = "http://www.roblox.com/asset/?id=6661762894"
		ValueBG.Image = "http://www.roblox.com/asset/?id=6661850089"
		Icon.Image = "http://www.roblox.com/asset/?id=6672257305"
		Slider.Name = str or "DragSlider"
		Slider.Parent = Tab
		Slider.BackgroundColor3 = Color3.fromRGB(22, 25, 35)
		Slider.BorderSizePixel = 0
		Slider.Position = UDim2.new(0, 0, 1.00000012, 0)
		Slider.Size = UDim2.new(1, 0, 1, 0)
		Slider.AutoButtonColor = false
		Slider.ZIndex = 8
		Slider.Font = Enum.Font.Highway
		Slider.Text = str or "DragSlider"
		Slider.TextColor3 = Color3.fromRGB(188, 189, 208)
		Slider.TextSize = 20.000
		Slider.TextWrapped = true
		Detector.Name = "Detector"
		Detector.Parent = Slider
		Detector.BackgroundColor3 = Color3.fromRGB(40, 42, 54)
		Detector.BackgroundTransparency = 1.000
		Detector.Size = UDim2.new(2.07294893, 0, 1, 0)
		Detector.ZIndex = 0
		SliderBG.Name = "SliderBG"
		SliderBG.Parent = Slider
		SliderBG.BackgroundColor3 = Color3.fromRGB(40, 42, 54)
		SliderBG.Position = UDim2.new(0.053, 0, 0, 0)
		SliderBG.Size = UDim2.new(0.946282327, 0, 1, 0)
		SliderBG.ZIndex = 1
		UICorner.CornerRadius = UDim.new(0.200000003, 0)
		UICorner.Parent = SliderBG
		SliderLine.Name = "SliderLine"
		SliderLine.Parent = SliderBG
		SliderLine.BackgroundColor3 = Color3.fromRGB(255, 20, 55)
		SliderLine.BorderSizePixel = 0
		SliderLine.Position = UDim2.new(0.0623763539, 0, 0.479999989, 0)
		SliderLine.Size = UDim2.new(0.866338253, 0, 0.0799999982, 0)
		SliderLine.ZIndex = 2
		SliderDrag.Name = "SliderDrag"
		SliderDrag.Parent = SliderLine
		SliderDrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SliderDrag.BackgroundTransparency = 1.000
		SliderDrag.BorderSizePixel = 0
		SliderDrag.Position = UDim2.new(-0.0801321045, 0, -4.5, 0)
		SliderDrag.Size = UDim2.new(0.168660358, 0, 10, 0)
		SliderDrag.ZIndex = 3
		SliderDrag.AutoButtonColor = false
		SliderDrag.ScaleType = Enum.ScaleType.Fit
		Container.Name = "Container"
		Container.Parent = SliderDrag
		Container.BackgroundColor3 = Color3.fromRGB(40, 42, 54)
		Container.BackgroundTransparency = 1.000
		Container.Position = UDim2.new(-0.240999997, 0, -1.20000005, 0)
		Container.Size = UDim2.new(1.44599998, 0, 1.25, 0)
		Container.ZIndex = 1
		Container.ClipsDescendants = true
		ValueBG.Name = "ValueBG"
		ValueBG.Parent = Container
		ValueBG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ValueBG.BackgroundTransparency = 1.000
		ValueBG.BorderSizePixel = 0
		ValueBG.ClipsDescendants = true
		ValueBG.Position = UDim2.new(-0.100355983, 0, 1, 0)
		ValueBG.Size = UDim2.new(1.20038807, 0, 1.00999999, 0)
		ValueBG.ZIndex = 6
		ValueBG.ScaleType = Enum.ScaleType.Fit
		SliderText.Name = "SliderText"
		SliderText.Parent = ValueBG
		SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SliderText.BackgroundTransparency = 1.000
		SliderText.Position = UDim2.new(0, 0, 0.0799999982, 0)
		SliderText.Size = UDim2.new(1, 0, 0.479999989, 0)
		SliderText.ZIndex = 7
		SliderText.Font = Enum.Font.Highway
		SliderText.Text = ""
		SliderText.TextColor3 = Color3.fromRGB(200, 203, 231)
		SliderText.TextScaled = true
		SliderText.TextSize = 15.000
		SliderText.TextWrapped = true
		Icon.Name = "Icon"
		Icon.Parent = Slider
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(0.833333015, 0, 0.12987946, 0)
		Icon.Size = UDim2.new(0.159999996, 0, 0.839999974, 0)
		Icon.ZIndex = 9
		Icon.ImageTransparency = 0.200
		Icon.ScaleType = Enum.ScaleType.Fit
		DragCons.Name = "DragCons"
		DragCons.Parent = SliderDrag
		DragCons.AspectRatio = 1.037
		--Effect
		--Slider
		Slider.MouseEnter:Connect(function()
			local Hover = TS:Create(Slider, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26, 30, 42)})	
			Hover:Play()
			local SlideOut = TS:Create(SliderBG, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {Position = UDim2.new(1, 0, 0, 0)})
			SlideOut:Play()
		end)
		Slider.MouseLeave:Connect(function()
			local Leave = TS:Create(Slider, TweenInfo.new(0.36, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(22, 25, 35)})	
			Leave:Play()
		end)
		--Detector
		Detector.MouseLeave:Connect(function()
			local SlideIn = TS:Create(SliderBG, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {Position = UDim2.new(0.053, 0, 0, 0)})
			SlideIn:Play()
			local Leave = TS:Create(SliderBG, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(40, 42, 54)})	
			Leave:Play()
			local Hide = TS:Create(ValueBG, TweenInfo.new(0.36, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(-0.100355983, 0, 1, 0)})
			Hide:Play()
		end)
		--SliderBG
		SliderBG.MouseEnter:Connect(function()
			local Hover = TS:Create(SliderBG, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(35, 37, 48)})	
			Hover:Play()
		end)
		SliderBG.MouseLeave:Connect(function()
			local Leave = TS:Create(SliderBG, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(40, 42, 54)})	
			Leave:Play()
		end)
		--SliderDrag
		SliderDrag.MouseEnter:Connect(function()
			local Show = TS:Create(ValueBG, TweenInfo.new(0.33, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Position = UDim2.new(-0.100355983, 0, 0, 0)})
			Show:Play()
		end)
		SliderDrag.MouseLeave:Connect(function()
			if not dragging then
			local Hide = TS:Create(ValueBG, TweenInfo.new(0.36, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(-0.100355983, 0, 1, 0)})
			Hide:Play()
			end
		end)
		--
		--Callback
		if min and max and def and callback then
		SliderText.Text = tostring(def)
		local function move(input)
			local pos = UDim2.new(math.clamp((input.Position.X - SliderLine.AbsolutePosition.X) / SliderLine.AbsoluteSize.X, 0, 1), -10.2,-4.4,0)
			SliderDrag:TweenPosition(pos, "Out", "Quad", 0.36, true)
			local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
			SliderText.Text = tostring(value)
			pcall(callback, value)
		end
		SliderDrag.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
				local function Two()
				local DraggingOn = TS:Create(SliderLine, TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 178, 178)})
				local DraggingOnT = TS:Create(SliderLine, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.4})
				local IconClicked = TS:Create(Icon, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0})
				DraggingOn:Play()
				DraggingOnT:Play()	
				IconClicked:Play()	
				end	
				local function One()
				local Show = TS:Create(ValueBG, TweenInfo.new(0.23, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(-0.100355983, 0, 0, 0)})
				local Change = TS:Create(ValueBG, TweenInfo.new(0.36, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(129, 255, 234)})
				Show:Play()	
				wait(0.05)
				Change:Play()
				end	
				local onecoro, twocoro = coroutine.create(One), coroutine.create(Two)
				coroutine.resume(onecoro)
				coroutine.resume(twocoro)
			end
		end)
		SliderDrag.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = false
				local function Two()
				local DraggingOff = TS:Create(SliderLine, TweenInfo.new(0.36, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(255, 20, 25)})
				local DraggingOffT = TS:Create(SliderLine, TweenInfo.new(0.36, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 0})
				local IconReturn = TS:Create(Icon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.200})	
				DraggingOff:Play()
				DraggingOffT:Play()	
				IconReturn:Play()
				end
				local function One()
				local Hide = TS:Create(ValueBG, TweenInfo.new(0.36, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(-0.100355983, 0, 1, 0)})
				local Revert = TS:Create(ValueBG, TweenInfo.new(0.36, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				Revert:Play()	
				wait(0.15)
				Hide:Play()
				end
				local onecoro, twocoro = coroutine.create(One), coroutine.create(Two)
				coroutine.resume(onecoro)
				coroutine.resume(twocoro)
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
				move(input)
			end
			end)
		end
		
	end
	-- ‹
	
	return ElementsList
end
return Atomos;
