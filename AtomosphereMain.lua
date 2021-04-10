local Atomos = {}
local TabCount = 0
local TS = game:GetService("TweenService")

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
	local function dragify(Frame)
		local dragToggle = nil
		local dragSpeed = .4 -- You can edit this.
		local dragInput = nil
		local dragStart = nil
		local dragPos = nil

		function updateInput(input)
			local Delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(.25), {Position = Position}):Play()
		end

		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
				dragToggle = true
				dragStart = input.Position
				startPos = Frame.Position
				input.Changed:Connect(function()
					if (input.UserInputState == Enum.UserInputState.End) then
						dragToggle = false
					end
				end)
			end
		end)

		Frame.InputChanged:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				dragInput = input
			end
		end)

		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if (input == dragInput and dragToggle) then
				updateInput(input)
			end
		end)
	end
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
	dragify(game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.01):WaitForChild(Name or "NewTab".. TabCount, 0.2))
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
		Button.Name = "Button"
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
			callback()
			local Clicked = TS:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 238, 249)})
			local Return = TS:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(188, 189, 208)})
			Clicked:Play()
			Clicked.Completed:Connect(function(playbackState)
			wait(0.1)
			Return:Play()
			end)
		end)
	end
	--
	return ElementsList
end
return Atomos;
