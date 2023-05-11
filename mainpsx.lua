-- Dependencias da Livraria
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("Venyx", 5013109572)

-- Tema
local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(0, 0, 0),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(255, 255, 255)
}

-- Primeira Página
local Farming = venyx:addPage("Farming", 5012544693)
local MainSec = Farming:addSection("Main!")
local ExtrasSec = Farming:addSection("Extras!")
local BoostsSec = Farming:addSection("Boosts!")

MainSec:addToggle("Super Farm", false, function(uwu)


    if uwu then
 
                while uwu do
                 
                _G.AutoFarm = true
                _G.Area = 'Cyber Cavern'
                 
                local Client = require(game.ReplicatedStorage.Library.Client)
                local Library = require(game.ReplicatedStorage.Library)
                local Orbs = getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.Game.Orbs)
                 
                debug.setupvalue(Client.Network.Invoke, 1, function() return true end)
                debug.setupvalue(Client.Network.Fire, 1, function() return true end)
                 
                function GetCoins(Area)
                    local Coins = {}
                    for i,v in next, Client.Network.Invoke('Get Coins') do 
                        if v.a == Area then 
                            Coins[i] = v
                        end 
                    end 
                    return Coins
                end 
                 
                function GetPets()
                    return Client.PetCmds.GetEquipped() 
                end 
                 
                for i,v in pairs(workspace.__THINGS.Orbs:GetChildren()) do 
                    Orbs.Collect(v)
                end 
                 
                workspace.__THINGS.Orbs.ChildAdded:Connect(function(v)
                    Orbs.Collect(v)
                end)
                 
                while true do 
                    if _G.AutoFarm then
                        local Pets = GetPets()
                        local Coins = GetCoins(_G.Area or 'Town')
                        for i,v in next, Coins do
                            if workspace.__THINGS.Coins:FindFirstChild(i) and _G.AutoFarm then 
                                for _,Pet in next, Pets do 
                                    spawn(function()
                                        if _G.AutoFarm then
                                            Client.Network.Invoke('Join Coin', i, {Pet.uid})
                                            Client.Network.Fire('Farm Coin', i, Pet.uid)
                                        end
                            end)
                            task.wait(0.0000000000000000000000000001)
                        end 
                        task.wait(0.0000000000000000000000000001)
                    end
                    task.wait(0.0000000000000000000000000001)
                end
                end
                end
                end
            else
                uwu = false
                _G.AutoFarm = false
 
                
                
end
end)


ExtrasSec:addToggle("Auto Collect Orbs", false, function(owo)

orbslol = owo

    if orbslol then
        while orbslol do
            wait(0.0000000001) -- Espera 1 segundo antes de executar o próximo loop
        
            -- Encontra o jogador
            local player = game.Players.LocalPlayer
        
            -- Verifica se o jogador existe e possui um personagem
            if player and player.Character then
                -- Encontra todas as orbs em game.Workspace.__THINGS.Orbs
                local orbs = game.Workspace.__THINGS.Orbs:GetDescendants()
        
                -- Loop através de cada orb encontrada
                for _, orb in ipairs(orbs) do
                    -- Verifica se a orb é uma parte
                    if orb:IsA("BasePart") then
                        -- Teleporta a orb para o jogador
                        orb.CFrame = player.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end
    else
        orbslol = false
    end



end)



ExtrasSec:addToggle("Auto Collect Lootbags", false, function(owo)

    lootbagslol = owo
    
        if lootbagslol then
            while lootbagslol do
                wait(0.0000000001) -- Espera 1 segundo antes de executar o próximo loop
            
                -- Encontra o jogador
                local player = game.Players.LocalPlayer

                -- Verifica se o jogador existe e possui um personagem
                if player and player.Character then
                    -- Encontra todas as lootbags em game.Workspace.__THINGS.Lootbags
                    local lootbags = game.Workspace.__THINGS.Lootbags:GetDescendants()
            
                    -- Loop através de cada lootbag encontrada
                    for _, lootbag in ipairs(lootbags) do
                        -- Verifica se a lootbag é uma parte
                        if lootbag:IsA("BasePart") then
                            -- Teleporta a lootbag para o jogador
                            lootbag.CFrame = player.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
            end
        else
            lootbagslol = false
        end
    
    
    
    end)


    BoostsSec:addToggle("Auto Use Ultra Lucky Boost", false, function(owo)

        if owo then
        while owo do
            wait(1)
    
            local boostsFrame = game.Players.LocalPlayer.PlayerGui.Main.Boosts:FindFirstChild("Ultra Lucky")
            
            if not boostsFrame then
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Ultra Lucky")
            end
            
            while boostsFrame do
                wait(1)
                boostsFrame = game.Players.LocalPlayer.PlayerGui.Main.Boosts:FindFirstChild("Ultra Lucky")
            end
        end
    end
    end)


    BoostsSec:addToggle("Auto Use Super Lucky Boost", false, function(owo)

        if owo then
        while owo do
            wait(1)
    
            local boostsFrame = game.Players.LocalPlayer.PlayerGui.Main.Boosts:FindFirstChild("Super Lucky")
            
            if not boostsFrame then
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Super Lucky")
            end
            
            while boostsFrame do
                wait(1)
                boostsFrame = game.Players.LocalPlayer.PlayerGui.Main.Boosts:FindFirstChild("Super Lucky")
            end
        end
    end
end)

BoostsSec:addToggle("Auto Use Triple Damage Boost", false, function(owo)

    if owo then
    while owo do
        wait(1)

        local boostsFrame = game.Players.LocalPlayer.PlayerGui.Main.Boosts:FindFirstChild("Triple Damage")
        
        if not boostsFrame then
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Triple Damage")
        end
        
        while boostsFrame do
            wait(1)
            boostsFrame = game.Players.LocalPlayer.PlayerGui.Main.Boosts:FindFirstChild("Triple Damage")
        end
    end
end
end)

BoostsSec:addToggle("Auto Use Triple Coins Boost", false, function(owo)

    if owo then
    while owo do
        wait(1)

        local boostsFrame = game.Players.LocalPlayer.PlayerGui.Main.Boosts:FindFirstChild("Triple Coins")
        
        if not boostsFrame then
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Triple Coins")
        end
        
        while boostsFrame do
            wait(1)
            boostsFrame = game.Players.LocalPlayer.PlayerGui.Main.Boosts:FindFirstChild("Triple Coins")
        end
    end
end
end)

-- load
venyx:SelectPage(venyx.pages[2], true)