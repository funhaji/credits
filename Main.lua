
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
local notificationFrame = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local copyButton = Instance.new("TextButton")

gui.ResetOnSpawn = false
gui.Name = "NotificationGui"
gui.Parent = player:WaitForChild("PlayerGui")

notificationFrame.Name = "NotificationFrame"
notificationFrame.Size = UDim2.new(0, 300, 0, 80)
notificationFrame.Position = UDim2.new(0.5, -150, -0.1, 0) -- Start off-screen
notificationFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
notificationFrame.BorderSizePixel = 0
notificationFrame.Parent = gui

titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Join our Discord!"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 18
titleLabel.Parent = notificationFrame

copyButton.Name = "CopyButton"
copyButton.Size = UDim2.new(1, 0, 0, 40)
copyButton.Position = UDim2.new(0, 0, 0, 40)
copyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
copyButton.BorderSizePixel = 0
copyButton.Text = "Click here to copy Discord link"
copyButton.TextColor3 = Color3.fromRGB(200, 200, 200)
copyButton.Font = Enum.Font.Gotham
copyButton.TextSize = 16
copyButton.Parent = notificationFrame


copyButton.MouseEnter:Connect(function()
    TweenService:Create(copyButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
end)

copyButton.MouseLeave:Connect(function()
    TweenService:Create(copyButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
end)


copyButton.MouseButton1Click:Connect(function()
    local success, errorMessage = pcall(function()
        setclipboard("https://discord.gg/HV22NPMzqz")
    end)

    if success then
        copyButton.Text = "Link copied!"
        wait(2)
        copyButton.Text = "Click here to copy Discord link"
    else
        warn("Failed to copy to clipboard:", errorMessage)
    end
end)


local function showNotification()
   
    local slideIn = TweenService:Create(notificationFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 0, 20)})
    slideIn:Play()

  
    wait(7)

 
    local slideOut = TweenService:Create(notificationFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, -0.1, 0)})
    slideOut:Play()


    slideOut.Completed:Wait()
    gui:Destroy()
end


showNotification()
