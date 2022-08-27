
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterCommand("ping", function(source, args, rawCommand)
    local pos = GetEntityCoords(PlayerPedId())
    print(pos)

end, false )



function menu()

    local menuloc = RageUI.CreateMenu("Menu Location Beateau", "Bienvenue dans notre location !")

    RageUI.Visible(menuloc, not RageUI.Visible(menuloc))

    while menuloc do
        
        Citizen.Wait(0)

        RageUI.IsVisible(menuloc,true,true,true,function()
      

            RageUI.Separator(" Argent Disponible En Liquide ->[~g~"..ESX.Math.GroupDigits(ESX.PlayerData.money.."$~s~]"))

          RageUI.ButtonWithStyle("JetSki","JetSki sans permis", {RightLabel = " 130~g~$/~u~h "}, true, function(Hovered, Active, Selected)
            if Selected then    
                 print("J'ai appuyer sur le bouton")
                    TriggerServerEvent('buy:jetski') 
                        local ModelHash = Configjetski
                            if not IsModelInCdimage(ModelHash) then return end
                                RequestModel(ModelHash) 
               while not HasModelLoaded(ModelHash) do 
                 Citizen.Wait(10)
               end
               local MyPed = PlayerPedId()
               local Vehicle = CreateVehicle(ModelHash, -1881.70, -1196.83, 0.29, GetEntityHeading(MyPed), true, false) 
               TaskWarpPedIntoVehicle(MyPed, Vehicle)
               
	           local retval  = GetVehiclePedIsIn(MyPed, false)
                DeleteVehicle(retval)
               
               
             end
        end)  


        RageUI.ButtonWithStyle("Bateau","Bateau sans permis", {RightLabel = " 130~g~$/~u~h "}, true, function(Hovered, Active, Selected)
            if Selected then    
               
               TriggerServerEvent('buy:jetski') 
               local ModelHash = ConfigBeateau
               if not IsModelInCdimage(ModelHash) then return end
               RequestModel(ModelHash) 
               while not HasModelLoaded(ModelHash) do 
                 Citizen.Wait(10)
               end
               local MyPed = PlayerPedId()
               local Vehicle = CreateVehicle(ModelHash, -1881.70, -1196.83, 0.29, GetEntityHeading(MyPed), true, false) 
               TaskWarpPedIntoVehicle(MyPed, Vehicle)
               GetVehiclePedIsIn(MyPed, false)
               DeleteVehicle(retval)
               
               
            end
        end)  

        
        end, function()
        end)

        if not RageUI.Visible(menuloc) then
            menuloc=RMenu:DeleteType("menuloc", true)
        end

    end

end




 Citizen.CreateThread(function()
    while true do 
        
    local interval = 1 
    local pos = GetEntityCoords(PlayerPedId())
    local dest = vector3(-1870.12, -1203.25, 13.01)
    local distance = GetDistanceBetweenCoords(pos, dest, true)
    
        if distance > 10 then
         interval = 300000
    
        else
    
        interval = 10
        DrawMarker(6, -1870.12, -1203.25, 13.01-0.98, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.55, 0.55, 0.55, 0, 150, 255, 255, false, false, 2, false, false, false, false)
    
      
        if distance < 1 then
    
        if IsControlJustPressed(1,51) then 
            menu()
        TriggerServerEvent('es:activateMoney')
                    end
                end
            end
    
            Citizen.Wait(interval)
                end
            
        end)