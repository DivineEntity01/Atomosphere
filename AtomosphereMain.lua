local Atomos = {}
local TabCount = 0
if not game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.01) then
	local Atomosphere = Instance.new("ScreenGui")
	Atomosphere.Name = "Atomosphere"
	Atomosphere.Parent = game:GetService("CoreGui")
elseif game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.01) then
	game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.01):Destroy()
end
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
	Tab.ImageTransparency = 1
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
	TabTitle.Text = Name or "NewTab"
	TabTitle.TextColor3 = Color3.fromRGB(188, 189, 208)
	TabTitle.TextSize = 25.000
	if TabCount > 1 then
		local Move = (game:GetService("CoreGui"):WaitForChild("Atomosphere", 0.05):GetChildren()[TabCount - 1].Position.X.Scale + 0.16)
		Tab.Position = UDim2.new(Move, 0, 0.0284167733, 0)
	end

end


return Atomos;
