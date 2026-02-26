local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PhantomHub_V1"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local FloatingButton = Instance.new("TextButton")
FloatingButton.Size = UDim2.new(0, 54, 0, 54)
FloatingButton.Position = UDim2.new(0, 50, 0.5, -27)
FloatingButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
FloatingButton.Text = ""
FloatingButton.Parent = ScreenGui

local UICornerBtn = Instance.new("UICorner")
UICornerBtn.CornerRadius = UDim.new(0, 12)
UICornerBtn.Parent = FloatingButton

local InnerBtn = Instance.new("Frame")
InnerBtn.Size = UDim2.new(0, 48, 0, 48)
InnerBtn.Position = UDim2.new(0.5, -24, 0.5, -24)
InnerBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InnerBtn.Parent = FloatingButton

local UICornerInner = Instance.new("UICorner")
UICornerInner.CornerRadius = UDim.new(0, 10)
UICornerInner.Parent = InnerBtn

local BtnLabel = Instance.new("TextLabel")
BtnLabel.Size = UDim2.new(1, 0, 1, 0)
BtnLabel.BackgroundTransparency = 1
BtnLabel.Text = "Z"
BtnLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnLabel.TextSize = 24
BtnLabel.Font = Enum.Font.SourceSansBold
BtnLabel.Parent = InnerBtn

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local UICornerFrame = Instance.new("UICorner")
UICornerFrame.CornerRadius = UDim.new(0, 12)
UICornerFrame.Parent = MainFrame

local InnerFrame = Instance.new("Frame")
InnerFrame.Size = UDim2.new(1, -6, 1, -6)
InnerFrame.Position = UDim2.new(0, 3, 0, 3)
InnerFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InnerFrame.Parent = MainFrame

local UICornerInnerF = Instance.new("UICorner")
UICornerInnerF.CornerRadius = UDim.new(0, 10)
UICornerInnerF.Parent = InnerFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TopBar.Parent = InnerFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 10)
TopCorner.Parent = TopBar

local ScriptTitle = Instance.new("TextLabel")
ScriptTitle.Size = UDim2.new(0, 150, 1, 0)
ScriptTitle.Position = UDim2.new(0, 10, 0, 0)
ScriptTitle.Text = "Zeno Hub"
ScriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptTitle.Font = Enum.Font.SourceSansBold
ScriptTitle.TextSize = 22
ScriptTitle.TextXAlignment = Enum.TextXAlignment.Left
ScriptTitle.BackgroundTransparency = 1
ScriptTitle.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -42, 0.5, -16)
CloseBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 18
CloseBtn.Parent = TopBar

local UICornerClose = Instance.new("UICorner")
UICornerClose.CornerRadius = UDim.new(0, 8)
UICornerClose.Parent = CloseBtn

local SideBar = Instance.new("Frame")
SideBar.Size = UDim2.new(0, 140, 1, -45)
SideBar.Position = UDim2.new(0, 0, 0, 45)
SideBar.BackgroundTransparency = 1
SideBar.Parent = InnerFrame

local MainContent = Instance.new("ScrollingFrame")
MainContent.Size = UDim2.new(1, -145, 1, -55)
MainContent.Position = UDim2.new(0, 145, 0, 50)
MainContent.BackgroundTransparency = 1
MainContent.ScrollBarThickness = 2
MainContent.CanvasSize = UDim2.new(0, 0, 0, 510)
MainContent.Parent = InnerFrame

local function createTabBtn(name, posIdx)
local Btn = Instance.new("TextButton")
Btn.Size = UDim2.new(0.85, 0, 0, 40)
Btn.Position = UDim2.new(0.075, 0, 0, 20 + (posIdx * 50))
Btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Btn.Text = name
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = Enum.Font.SourceSansBold
Btn.TextSize = 18
Btn.Parent = SideBar
Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)
return Btn
end

local TabMain = createTabBtn("Main", 0)
local TabBuy = createTabBtn("Buy ALL", 1)
local TabFarm = createTabBtn("Farm", 2)
local TabCredits = createTabBtn("Credits", 3)

local options = {Main = {}, Buy = {}, Farm = {}, Credits = {}}

local function createOption(name, posIdx, startActive, tab, callback)
local Container = Instance.new("Frame")
Container.Size = UDim2.new(0.95, 0, 0, 50)
Container.Position = UDim2.new(0, 0, 0, posIdx * 60)
Container.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Container.Visible = (tab == "Main")
Container.Parent = MainContent
Instance.new("UICorner", Container).CornerRadius = UDim.new(0, 10)

local Label = Instance.new("TextLabel")  
Label.Size = UDim2.new(0.6, 0, 1, 0)  
Label.Position = UDim2.new(0.05, 0, 0, 0)  
Label.Text = name  
Label.TextColor3 = Color3.fromRGB(255, 255, 255)  
Label.BackgroundTransparency = 1  
Label.TextXAlignment = Enum.TextXAlignment.Left  
Label.Font = Enum.Font.SourceSans  
Label.TextSize = 16  
Label.Parent = Container  

local SwitchBG = Instance.new("TextButton")  
SwitchBG.Size = UDim2.new(0, 45, 0, 24)  
SwitchBG.Position = UDim2.new(1, -55, 0.5, -12)  
SwitchBG.BackgroundColor3 = startActive and Color3.fromRGB(150, 150, 150) or Color3.fromRGB(40, 40, 40)  
SwitchBG.Text = ""  
SwitchBG.Parent = Container  
Instance.new("UICorner", SwitchBG).CornerRadius = UDim.new(1, 0)  

local Circle = Instance.new("Frame")  
Circle.Size = UDim2.new(0, 18, 0, 18)  
Circle.Position = startActive and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)  
Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)  
Circle.Parent = SwitchBG  
Instance.new("UICorner", Circle).CornerRadius = UDim.new(1, 0)  

local active = startActive  
SwitchBG.MouseButton1Click:Connect(function()  
    active = not active  
    Circle:TweenPosition(active and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9), "Out", "Quad", 0.2, true)  
    SwitchBG.BackgroundColor3 = active and Color3.fromRGB(150, 150, 150) or Color3.fromRGB(40, 40, 40)  
    if callback then callback(active) end  
end)  

table.insert(options[tab], Container)  
return function() return active end

end

local function createInfoBox(title, desc, posIdx, tab, isButton, linkToCopy)
local Container = Instance.new("Frame")
Container.Size = UDim2.new(0.95, 0, 0, 50)
Container.Position = UDim2.new(0, 0, 0, posIdx * 60)
Container.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Container.Visible = false
Container.Parent = MainContent
Instance.new("UICorner", Container).CornerRadius = UDim.new(0, 10)

local TitleLabel = Instance.new("TextLabel")  
TitleLabel.Size = UDim2.new(0.9, 0, 0.5, 0)  
TitleLabel.Position = UDim2.new(0.05, 0, 0, 5)  
TitleLabel.Text = title  
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  
TitleLabel.BackgroundTransparency = 1  
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left  
TitleLabel.Font = Enum.Font.SourceSansBold  
TitleLabel.TextSize = 16  
TitleLabel.Parent = Container  

local DescLabel = Instance.new("TextLabel")  
DescLabel.Size = UDim2.new(0.9, 0, 0.5, 0)  
DescLabel.Position = UDim2.new(0.05, 0, 0.5, -2)  
DescLabel.Text = desc  
DescLabel.TextColor3 = Color3.fromRGB(200, 200, 200)  
DescLabel.BackgroundTransparency = 1  
DescLabel.TextXAlignment = Enum.TextXAlignment.Left  
DescLabel.Font = Enum.Font.SourceSans  
DescLabel.TextSize = 14  
DescLabel.Parent = Container  

if isButton then  
    local ClickBtn = Instance.new("TextButton")  
    ClickBtn.Size = UDim2.new(1, 0, 1, 0)  
    ClickBtn.BackgroundTransparency = 1  
    ClickBtn.Text = ""  
    ClickBtn.Parent = Container  
    ClickBtn.MouseButton1Click:Connect(function()  
        if setclipboard then setclipboard(linkToCopy) end  
    end)  
end  

table.insert(options[tab], Container)

end

local isAutoRebirth = createOption("Auto Rebirth", 0, false, "Main")
local isAutoBuyBrainrot = createOption("Auto Buy Brainrots", 1, false, "Main")
local isAutoCollect = createOption("Auto Collect Money", 2, false, "Main")
local isPlayerESP = createOption("Player ESP (Red Aura)", 3, false, "Main")

local originalMaterials = {}
local isLowMode = createOption("Low Mode", 4, false, "Main", function(active)
if active then
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA("BasePart") and (v.Name == "Part" or v.Name == "Floor") then
originalMaterials[v] = v.Material
v.Material = Enum.Material.Air
end
end
else
for part, mat in pairs(originalMaterials) do
if part and part.Parent then part.Material = mat end
end
originalMaterials = {}
end
end)

local isInstantBrainrot = createOption("Instant Collect Brainrots", 5, true, "Main")
local isGodRagdoll = createOption("Anti Ragdoll", 6, true, "Main")

local buyIce = createOption("Auto Ice Emblem", 0, false, "Buy")
local buyVic = createOption("Auto Victrola", 1, false, "Buy")
local buyStar = createOption("Auto Star", 2, false, "Buy")
local buyFlow = createOption("Auto Flower", 3, false, "Buy")
local buyPhon = createOption("Auto Phone", 4, false, "Buy")

local isAutoMystic = createOption("Auto Mystic", 0, false, "Farm")
local isAutoSecret = createOption("Auto Secret", 1, false, "Farm")
local isAutoStellar = createOption("Auto Stellar", 2, false, "Farm")

createInfoBox("By: morbex", "Script created by morbex.", 0, "Credits", false)
createInfoBox("Discord", "My Discord server.", 1, "Credits", true, "https://discord.gg/bxZtRj892k")

local function showTab(tabName)
for _, v in pairs(options.Main) do v.Visible = (tabName == "Main") end
for _, v in pairs(options.Buy) do v.Visible = (tabName == "Buy") end
for _, v in pairs(options.Farm) do v.Visible = (tabName == "Farm") end
for _, v in pairs(options.Credits) do v.Visible = (tabName == "Credits") end
end

TabMain.MouseButton1Click:Connect(function() showTab("Main") end)
TabBuy.MouseButton1Click:Connect(function() showTab("Buy") end)
TabFarm.MouseButton1Click:Connect(function() showTab("Farm") end)
TabCredits.MouseButton1Click:Connect(function() showTab("Credits") end)

local dragging, dragStart, startPos
FloatingButton.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = FloatingButton.Position
end
end)
UserInputService.InputChanged:Connect(function(input)
if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
local delta = input.Position - dragStart
FloatingButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
end)
UserInputService.InputEnded:Connect(function() dragging = false end)
FloatingButton.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)
CloseBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false end)

local brainrotsFolder = workspace:WaitForChild("Client", 10):WaitForChild("Path", 5):WaitForChild("Brainrots", 5)
local targetHead = nil
local isHidden = false

local mythicNames = {["Gorillo Watermelondrillo"] = true, ["Frigo Camelo"] = true, ["Girafa Celestre"] = true, ["Ganganzelli Trulala"] = true, ["Tigroligre Frutonni"] = true}
local secretNames = {["La Vacca Saturno Saturnita"] = true, ["Esok Sekolah"] = true, ["Tralaledon"] = true, ["Garama and Madundung"] = true}
local stellarNames = {["Meowl"] = true, ["Capitano Clash Warnini"] = true, ["Strawberry Elephant"] = true}

local function setVisibility(visible)
local char = Player.Character
if not char then return end
local transparency = visible and 0 or 1
for _, v in pairs(char:GetDescendants()) do
if v:IsA("BasePart") or v:IsA("Decal") then
if v.Name ~= "HumanoidRootPart" then v.Transparency = transparency end
elseif v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
v.Enabled = visible
end
end
isHidden = not visible
end

RunService.Heartbeat:Connect(function()
local autoMystic = isAutoMystic()
local autoSecret = isAutoSecret()
local autoStellar = isAutoStellar()

if not (autoMystic or autoSecret or autoStellar) then   
    targetHead = nil   
    if isHidden then setVisibility(true) end  
    return   
end  

local char = Player.Character  
local root = char and char:FindFirstChild("HumanoidRootPart")  
if not root then return end  

if targetHead and targetHead.Parent and targetHead.Parent.Parent == brainrotsFolder then  
    root.CFrame = targetHead.CFrame  
    if not isHidden then setVisibility(false) end  
    return  
end  

targetHead = nil  
if isHidden then setVisibility(true) end  

for _, model in pairs(brainrotsFolder:GetChildren()) do  
    if model:IsA("Model") then  
        local ui = model:FindFirstChild("Brainrot_UI")  
        local frame = ui and ui:FindFirstChild("Frame")  
        local rarityLbl = frame and frame:FindFirstChild("Rarity")  
        local titleLbl = frame and frame:FindFirstChild("Title")  
        local head = model:FindFirstChild("Head")  

        if head and frame then  
            local isTarget = false  
            local rarityText = rarityLbl and string.lower(rarityLbl.Text) or ""  
            local titleText = titleLbl and titleLbl.Text or ""  

            if autoMystic and (string.find(rarityText, "mythic") or mythicNames[titleText]) then  
                isTarget = true  
            elseif autoSecret and (string.find(rarityText, "secret") or secretNames[titleText]) then  
                isTarget = true  
            elseif autoStellar and (string.find(rarityText, "stellar") or stellarNames[titleText]) then  
                isTarget = true  
            end  

            if isTarget then  
                targetHead = head  
                root.CFrame = head.CFrame  
                break  
            end  
        end  
    end  
end

end)

task.spawn(function()
local Bridge = ReplicatedStorage:WaitForChild("Remotes", 5):WaitForChild("Bridge")
while task.wait(0.5) do
if isAutoRebirth() then pcall(function() Bridge:FireServer("General", "Rebirth", "Use") end) end
end
end)

task.spawn(function()
local Bridge = ReplicatedStorage:WaitForChild("Remotes", 5):WaitForChild("Bridge")
while task.wait(1) do
if isAutoCollect() then
pcall(function()
for i = 1, 15 do Bridge:FireServer("General", "Brainrots", "Collect", "Slot" .. i) end
end)
end
end
end)

task.spawn(function()
while task.wait(1.5) do
if isInstantBrainrot() then
pcall(function()
for _, obj in pairs(workspace:GetDescendants()) do
if obj:IsA("ProximityPrompt") then obj.HoldDuration = 0 end
end
end)
end
end
end)

task.spawn(function()
local blackListNames = {["SellPrompt"] = true, ["GrabPrompt"] = true, ["PlacePrompt"] = true, ["AddPrompt"] = true}
while task.wait(0.1) do
if isAutoBuyBrainrot() then
pcall(function()
local char = Player.Character
if char and char:FindFirstChild("HumanoidRootPart") then
local root = char.HumanoidRootPart
for _, prompt in pairs(workspace:GetDescendants()) do
if prompt:IsA("ProximityPrompt") and prompt.Enabled then
if not blackListNames[prompt.Name] then
local part = prompt.Parent
local model = part and part:FindFirstAncestorOfClass("Model")
local isMerchant = model and (model.Name == "IngredientsMerchant" or model.Name == "RobuxMerchant")
if part and part:IsA("BasePart") and not isMerchant then
local distance = (root.Position - part.Position).Magnitude
if distance <= prompt.MaxActivationDistance then fireproximityprompt(prompt) end
end
end
end
end
end
end)
end
end
end)

task.spawn(function()
while task.wait(1) do
local espAtivo = isPlayerESP()
for _, p in pairs(game.Players:GetPlayers()) do
if p ~= Player then
local char = p.Character
if char then
local highlight = char:FindFirstChild("PhantomESP")
if espAtivo then
if not highlight then
highlight = Instance.new("Highlight")
highlight.Name = "PhantomESP"
highlight.FillColor = Color3.fromRGB(255, 0, 0)
highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
highlight.FillTransparency = 0.5
highlight.Parent = char
end
else
if highlight then highlight:Destroy() end
end
end
end
end
end
end)

RunService.Heartbeat:Connect(function()
if isGodRagdoll() then
local char = Player.Character
if char and char:FindFirstChild("HumanoidRootPart") then
local root = char.HumanoidRootPart
if root:FindFirstChild("RagdollWeld") then root.RagdollWeld:Destroy() end
for _, v in pairs(char:GetDescendants()) do
if v:IsA("Motor6D") then v.Enabled = true end
if v:IsA("BallSocketConstraint") or v:IsA("NoCollisionConstraint") then v:Destroy() end
end
end
end
end)

local function isAnyBuyActive()
return buyIce() or buyVic() or buyStar() or buyFlow() or buyPhon()
end

PlayerGui.Notification.DescendantAdded:Connect(function(descendant)
local rebirthActive = isAutoRebirth()
local ingredientsActive = isAnyBuyActive()
if rebirthActive or ingredientsActive then
if descendant:IsA("TextLabel") or descendant:IsA("Frame") or descendant.Name == "Template" or descendant.Name == "Value" then
RunService.RenderStepped:Wait()
local shouldDestroy = false
local text = ""
pcall(function()
if descendant:IsA("TextLabel") then text = descendant.Text
elseif descendant:FindFirstChild("Value") and descendant.Value:IsA("TextLabel") then text = descendant.Value.Text end
end)
if rebirthActive and (text:find("enough money") or text:find("necessary Brainrots")) then shouldDestroy = true end
if ingredientsActive and not shouldDestroy then shouldDestroy = true end
if shouldDestroy then descendant:Destroy() end
end
end
end)

local buyList = {
{get = buyIce, name = "IceEmblem"},
{get = buyVic, name = "Victrola"},
{get = buyStar, name = "Star"},
{get = buyFlow, name = "Flower"},
{get = buyPhon, name = "Phone"}
}

task.spawn(function()
local Bridge = ReplicatedStorage:WaitForChild("Remotes", 5):WaitForChild("Bridge")
while task.wait(1) do
if isAnyBuyActive() then
pcall(function()
for _, i 
