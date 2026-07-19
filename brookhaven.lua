local ReplicatedStorage = game:GetService("ReplicatedStorage")

local NameColorEvent = ReplicatedStorage.RE["RPNameColor"]
local NameTextEvent = ReplicatedStorage.RE["RPNameText"]
local NotifyEvent = ReplicatedStorage.Remotes.Notify

local API = {}

function API.loopColorChange()
    task.spawn(function()
        while true do
            NameColorEvent:FireServer(
                "PickingRPNameColor",
                Color3.new(1, 0, 0.06)
            )

            task.wait(0.1)

            NameColorEvent:FireServer(
                "PickingRPNameColor",
                Color3.new(0, 0.21, 1)
            )

            task.wait(0.1)
        end
    end)
end

function API.initthing(rpName, rpBio, notification)
    NameTextEvent:FireServer("RolePlayName", rpName)
    NameTextEvent:FireServer("RolePlayBio", rpBio)

    firesignal(
        NotifyEvent.OnClientEvent,
        notification,
        nil,
        nil
    )
end

return API
