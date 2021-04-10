local Atomos = {}

function Atomos:NewTab(Name)
--Create MainGUI
if not game:GetService("Players").DivineEntity01.PlayerGui:WaitForChild("Atomosphere", 0.05) then
local Atomosphere = Instance.new("ScreenGui")
Atomosphere.Name = "Atomosphere"
Atomosphere.Parent = game.Players.LocalPlayer:WaitForChild("CoreGui")
wait(0.05)
end
-------------------------------------------------------------------------------------------------
	local Tab = Instance.new("ImageLabel")
	local ButtonListing = Instance.new("UIListLayout")
	local MaxMinSize = Instance.new("UISizeConstraint")
	local TabTitle = Instance.new("TextLabel")
	ButtonListing.Name = "ButtonListing"
	ButtonListing.Parent = Tab
	ButtonListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ButtonListing.SortOrder = Enum.SortOrder.LayoutOrder
	MaxMinSize.Name = "MaxMinSize"
	MaxMinSize.Parent = Tab
	MaxMinSize.MaxSize = Vector2.new(150, math.huge)
	MaxMinSize.MinSize = Vector2.new(125, 0)
	--Tab Name
	TabTitle.Name = "TabTitle"
	TabTitle.Parent = Tab
	TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabTitle.BackgroundTransparency = 1.000
	TabTitle.Position = UDim2.new(0.13333334, 0, 0, 0)
	TabTitle.Size = UDim2.new(0.733333349, 0, 1, 0)
	TabTitle.ZIndex = 2
	TabTitle.Font = Enum.Font.Highway
	TabTitle.Text = tostring(Name) or "New Tab"
	TabTitle.TextColor3 = Color3.fromRGB(188, 189, 208)
	TabTitle.TextSize = 25.000
	--Buttons
	local TabLib = {}
	--Normal Button
end



return Atomos;
