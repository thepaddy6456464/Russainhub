-- Door ESP and Entity Notifier

local Options = {
    ESPS_Font = { Value = Enum.Font.SourceSans },
    ESPS_FontSize = { Value = 20 },
    ESPS_FillTransparency = { Value = 0.7 },
    ESPS_OutlineTransparency = { Value = 0.2 },
    ESPS_FadeTime = { Value = 1 },
}

local EspTable = { Interactables = { Doors = {} } }

local function Esp(Parent, TextAdornee, Text, Color, OutlineColor)
    local BillboardGui = Instance.new("BillboardGui", Parent)
    local TextLabel = Instance.new("TextLabel", BillboardGui)
    local Highlight = Instance.new("Highlight", Parent)

    BillboardGui.Adornee = TextAdornee
    BillboardGui.AlwaysOnTop = true
    BillboardGui.Size = UDim2.fromScale(1, 1)

    TextLabel.Size = UDim2.fromScale(1, 1)
    TextLabel.TextStrokeTransparency = 0
    TextLabel.Font = Options.ESPS_Font.Value
    TextLabel.TextSize = Options.ESPS_FontSize.Value
    TextLabel.TextColor3 = Color
    TextLabel.BackgroundTransparency = 1

    Highlight.Adornee = Parent
    Highlight.FillColor = Color
    Highlight.OutlineColor = OutlineColor or Color
    TextLabel.TextTransparency = 1
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 1

    TextLabel:SetAttribute("Text", Text)

    task.spawn(function()
        while Parent do
            task.wait()
            local dist = (workspace.CurrentCamera.CFrame.Position - Parent:GetPivot().Position).Magnitude
            TextLabel.Text = Text .. "\n[ " .. (dist <= 9.9 and string.format("%.1f", dist) or string.format("%.0f", dist)) .. " ]"
        end
    end)

    local ts = game:GetService("TweenService")
    ts:Create(Highlight, TweenInfo.new(Options.ESPS_FadeTime.Value), {
        FillTransparency = Options.ESPS_FillTransparency.Value
    }):Play()
    ts:Create(Highlight, TweenInfo.new(Options.ESPS_FadeTime.Value), {
        OutlineTransparency = Options.ESPS_OutlineTransparency.Value
    }):Play()
    ts:Create(TextLabel, TweenInfo.new(Options.ESPS_FadeTime.Value), {
        TextTransparency = 0
    }):Play()

    return Highlight, TextLabel
end

local function RemoveEsp(Parent)
    for _, child in ipairs(Parent:GetChildren()) do
        if child.Name == "_LOLHAXBG" or child.Name == "_LOLHAXHL" then
            child:Destroy()
        end
    end
end

local function RunDoorESP()
    for i, v in ipairs(EspTable.Interactables.Doors) do
        if v[1] and v[1].Parent then
            RemoveEsp(v[1].Parent)
        end
    end
    EspTable.Interactables.Doors = {}

    local Rooms = workspace.CurrentRooms
    for _, room in pairs(Rooms:GetChildren()) do
        if room:IsA("Model") and room:FindFirstChild("Door") then
            local door = room:FindFirstChild("Door")
            local part = door.PrimaryPart or door:FindFirstChildWhichIsA("BasePart")
            if part then
                local h, t = Esp(
                    door,
                    part,
                    "Door",
                    Color3.new(1, 1, 1),
                    Color3.new(1, 1, 1)
                )
                table.insert(EspTable.Interactables.Doors, {h, t})
            end
        end
    end
end

local function EntityNotifier()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance < 50 then
                    print(player.Name .. " is nearby!")
                end
            end
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
    RunDoorESP()
    EntityNotifier()
end)
