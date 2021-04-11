local Atomos = {}
local TabCount = 0
local TS = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

if game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.001) then
	game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.001):Destroy()
end
local function CreateMain()
	local Atomosphere = Instance.new("ScreenGui")
	Atomosphere.Name = "Atomosphere"
	Atomosphere.Parent = game:GetService("CoreGui")
end
CreateMain()

function Atomos:NewTab(Name)
	local Main = game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.01)
	TabCount = TabCount + 1
	-------------------------------------------------------------------------------------------------
	--Create Tab
	local Tab = Instance.new("ImageLabel")
	local ButtonListing = Instance.new("UIListLayout")
	local MaxMinSize = Instance.new("UISizeConstraint")
	local TabTitle = Instance.new("TextLabel")
	Tab.Name = Name or "Tab".. TabCount
	Tab.Parent = Main
	Tab.BackgroundColor3 = Color3.fromRGB(22, 25, 35)
	Tab.BorderSizePixel = 0
	Tab.LayoutOrder = 5
	Tab.Position = UDim2.new(0.0173761956, 0, 0.0284167733, 0)
	Tab.Size = UDim2.new(0.130321458, 0, 0.033829499, 0)
	Tab.ZIndex = 2
	Tab.Image = "http://www.roblox.com/asset/?id=6657363591"
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
	TabTitle.Size = UDim2.new(0.733333349, 0, 1, 0)
	TabTitle.ZIndex = 2
	TabTitle.Font = Enum.Font.Highway
	TabTitle.Text = Name or "NewTab".. TabCount
	TabTitle.TextColor3 = Color3.fromRGB(188, 189, 208)
	TabTitle.TextSize = 25.000
	if TabCount > 1 then
		local Move = (game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.05):GetChildren()[TabCount - 1].Position.X.Scale + 0.1513)
		Tab.Position = UDim2.new(Move, 0, 0.0284167733, 0)
	end
	local ElementsList = {}
	function ElementsList:NewButton(str, callback) --Normal Button
		local Button = Instance.new("TextButton")
		Tab.BackgroundTransparency = 0 --Make the dark top part visible
		--str
		Button.Name = str or "Button"
		Button.Parent = Tab
		Button.BackgroundColor3 = Color3.fromRGB(22, 25, 35)
		Button.BorderSizePixel = 0
		Button.Position = UDim2.new(0, 0, 1.00000012, 0)
		Button.Size = UDim2.new(1, 0, 1, 0)
		Button.AutoButtonColor = false
		Button.Font = Enum.Font.Highway
		Button.Text = str or "NewButton"
		Button.TextColor3 = Color3.fromRGB(188, 189, 208)
		Button.TextSize = 20.000
		Button.TextWrapped = true
		--Callback
		Button.MouseButton1Click:Connect(function()
			local s, f = pcall(callback)
			if f then
				print("UserError: ", f)
			end
			local Clicked = TS:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 238, 249)})
			local Return = TS:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(188, 189, 208)})
			Clicked:Play()
			Clicked.Completed:Connect(function()
			wait(0.1)
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
	function ElementsList:KeyButton(str, key, change, callback) --KeyBind Button
		local KeyButton = Instance.new("TextButton")
		KeyButton.Name = str or "KeyButton"
		KeyButton.Parent = Tab
		KeyButton.BackgroundColor3 = Color3.fromRGB(22, 25, 35)
		KeyButton.BorderSizePixel = 0
		KeyButton.Position = UDim2.new(0, 0, 1.00000012, 0)
		KeyButton.Size = UDim2.new(1, 0, 1, 0)
		KeyButton.AutoButtonColor = false
		KeyButton.ZIndex = -4
		KeyButton.Font = Enum.Font.Highway
		KeyButton.Text = str or "KeyButton"
		KeyButton.TextColor3 = Color3.fromRGB(188, 189, 208)
		KeyButton.TextSize = 20.000
		KeyButton.TextWrapped = true
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
		KeyButton.AutoButtonColor = false
		KeyBind.ZIndex = -6
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
		Detector.ZIndex = -10
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
			local Clicked = TS:Create(KeyButton, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 238, 249)})
			local Return = TS:Create(KeyButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(188, 189, 208)})
			Clicked:Play()
			Clicked.Completed:Connect(function(playbackState)
				wait(0.1)
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
			local Hover = TS:Create(KeyBind, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(40, 42, 54)})	
			Hover:Play()
		end)
			--Detector
		Detector.MouseLeave:Connect(function()
			local Hover = TS:Create(KeyBind, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(40, 42, 54)})	
			Hover:Play()
			local SlideIn = TS:Create(KeyBind, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {Position = UDim2.new(0.659, 0, 0, 0)})
			SlideIn:Play()
		end)
		--
	end
	return ElementsList
end
return Atomos;
