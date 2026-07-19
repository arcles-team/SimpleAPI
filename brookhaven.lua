local ReplicatedStorage = game:GetService("ReplicatedStorage")

local NameColorEvent = ReplicatedStorage.RE["1RPNam1eColo1r"]
local NameTextEvent  = ReplicatedStorage.RE["1RPNam1eTex1t"]
local NotifyEvent    = ReplicatedStorage.Remotes.Notify

local COLOR_RED  = Color3.new(1, 0, 0.06)
local COLOR_BLUE = Color3.new(0, 0.21, 1)

local function loopColorChange()
    while true do
        NameColorEvent:FireServer("PickingRPNameColor", COLOR_RED)
        task.wait(0.1)
        
        NameColorEvent:FireServer("PickingRPNameColor", COLOR_BLUE)
        task.wait(0.1)
    end
end

local function initthing(rpn, rpb, notif)
  NameTextEvent:FireServer("RolePlayName", rpn)
  NameTextEvent:FireServer("RolePlayBio", rpb)
  firesignal(NotifyEvent.OnClientEvent, notif, nil, nil)
end

loopColorChange()
