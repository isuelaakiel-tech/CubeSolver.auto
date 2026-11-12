
-- CubeSolver.auto
-- Version 1: 3x3 Cube Color Input

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "CubeSolver"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(340, 480)
frame.Position = UDim2.new(0.5, -170, 0.5, -240)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.Text = "CUBESOLVER.AUTO"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.TextSize = 22
title.Parent = frame

local colors = {
    {name = "White", color = Color3.fromRGB(255,255,255)},
    {name = "Yellow", color = Color3.fromRGB(255,220,0)},
    {name = "Red", color = Color3.fromRGB(255,0,0)},
    {name = "Orange", color = Color3.fromRGB(255,140,0)},
    {name = "Blue", color = Color3.fromRGB(0,100,255)},
    {name = "Green", color = Color3.fromRGB(0,200,0)}
}

local selectedColor = 1
local stickers = {}

local selector = Instance.new("Frame")
selector.Size = UDim2.new(1, -20, 0, 45)
selector.Position = UDim2.fromOffset(10, 50)
selector.BackgroundTransparency = 1
selector.Parent = frame

for i, data in ipairs(colors) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1/6, -3, 1, 0)
    button.Position = UDim2.new((i-1)/6, 0, 0, 0)
    button.BackgroundColor3 = data.color
    button.Text = ""
    button.Parent = selector

    button.MouseButton1Click:Connect(function()
        selectedColor = i
    end)
end

local grid = Instance.new("Frame")
grid.Size = UDim2.fromOffset(270, 270)
grid.Position = UDim2.fromOffset(35, 110)
grid.BackgroundTransparency = 1
grid.Parent = frame

for i = 1, 54 do
    local button = Instance.new("TextButton")
    button.Size = UDim2.fromOffset(84, 42)
    button.Position = UDim2.fromOffset(
        ((i-1)%3)*90,
        math.floor((i-1)/3)*45
    )
    button.BackgroundColor3 = Color3.fromRGB(70,70,80)
    button.Text = tostring(i)
    button.TextSize = 16
    button.Parent = grid

    stickers[i] = 0

    button.MouseButton1Click:Connect(function()
        stickers[i] = selectedColor
        button.BackgroundColor3 = colors[selectedColor].color
        button.Text = ""
    end)
end

local solve = Instance.new("TextButton")
solve.Size = UDim2.new(0.8, 0, 0, 40)
solve.Position = UDim2.new(0.1, 0, 1, -85)
solve.Text = "CHECK 54 COLORS"
solve.TextSize = 17
solve.Parent = frame

solve.MouseButton1Click:Connect(function()
    local count = 0

    for _, value in ipairs(stickers) do
        if value ~= 0 then
            count += 1
        end
    end

    solve.Text = count .. "/54 COLORS ENTERED"
end)

local close = Instance.new("TextButton")
close.Size = UDim2.new(0.8, 0, 0, 35)
close.Position = UDim2.new(0.1, 0, 1, -40)
close.Text = "CLOSE"
close.Parent = frame

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

print("CubeSolver.auto loaded!")
