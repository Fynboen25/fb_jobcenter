local spawnped = true

-- OX Target system, benyt dit eget hvis du ønsker 
exports.ox_target:addSphereZone({
    coords = vec3(-547.7167, -209.1895, 37.6498), -- ændrer disse koordinater
    size = vec3(2, 2, 2),
    rotation = 257.0,
    debug = false,
    options = {
        {
            name = 'open_jobcenter',
            event = 'fb_jobcenter:åben',
            icon = 'fa-solid fa-suitcase',
            label = 'Jobcentret'
        }
    }
})

-- Jobcenterets context menu, bygget op på ox context menu
RegisterNetEvent('fb_jobcenter:åben', function(job)
    lib.registerContext({
        id = 'jobcenter_menu',
        title = '🏢Byens Jobcenter🏢',
        onExit = function()
        end,
        options = {
            {
                title = 'Stedet du kan få dit drømme job',
                icon = 'fa-solid fa-briefcase',
                progress = 100,
                colorScheme = 'blue',
            },
            {
                title = 'Kontanthjælp',
                icon = 'fa-solid fa-person',
                description = 'Du modtager jobbet som Kontanthjælp',
                onSelect = function(args)
                    lib.notify({
                        title = 'Byens Jobcenter',
                        description = '***Du valgte kontanthjælp!***',
                        type = 'success'
                    })
                end,
                metadata = {
                    {label = '💲Indkomst', value = '500 DKK'},
                   -- {label = 'Du modtager jobbet som', value = 'Kontanthjælp'}
                  },
                event = 'fb_jobcenter:job1'
            },
            {
                title = 'Skraldemand',
                icon = 'fa-solid fa-person',
                description = 'Du modtager jobbet som Skrlademand',
                onSelect = function(args)
                    lib.notify({
                        title = 'Byens Jobcenter',
                        description = '***Du valgte Skraldemand, som dit nye arbejde! Tilykke***',
                        type = 'success'
                    })
                end,
                metadata = {
                    {label = '💲Indkomst', value = '500 DKK'},
                   -- {label = 'Du modtager jobbet som', value = 'Skraldemand'}
                  },
                event = 'fb_jobcenter:job2'
            },
            {
                title = 'Skrædder', 
                icon = 'fa-solid fa-person',
                description = 'Du modtager jobbet som Skrædder',
                onSelect = function(args)
                    lib.notify({
                        title = 'Byens Jobcenter',
                        description = '***Du valgte Skrædder, som dit nye arbejde! Tilykke***',
                        type = 'success'
                    })
                end,
                metadata = {
                    {label = '💲Indkomst', value = '500 DKK'},
                   -- {label = 'Du modtager jobbet som', value = 'Skrædder'}
                  },
                event = 'fb_jobcenter:job3'
            },
            {
                title = 'Taxa Chauffører', 
                icon = 'fa-solid fa-person',
                description = 'Du modtager jobbet som Taxa Chauffører',
                onSelect = function(args)
                    lib.notify({
                        title = 'Byens Jobcenter',
                        description = '***Du valgte taxi, som dit nye arbejde! Tilykke***',
                        type = 'success'
                    })
                end,
                metadata = {
                    {label = '💲Indkomst', value = '500 DKK'},
                   -- {label = 'Du modtager jobbet som jobbet som', value = 'Taxa Chauffører'}
                  },
                event = 'fb_jobcenter:job4'
            },
            {
                title = 'Postnord', 
                icon = 'fa-solid fa-person',
                description = 'Du modtager jobbet som Postnord',
                onSelect = function(args)
                    lib.notify({
                        title = 'Byens Jobcenter',
                        description = '***Du valgte Postnord, som dit nye arbejde! Tilykke***',
                        type = 'success'
                    })
                end,
                metadata = {
                    {label = '💲Indkomst', value = '500 DKK'},
                   -- {label = 'Du modtager jobbet som', value = 'Postnord'}
                  },
                event = 'fb_jobcenter:job5'
            },
            {
                title = 'Fisker', 
                icon = 'fa-solid fa-person',
                description = 'Du modtager jobbet som Fisker',
                onSelect = function(args)
                    lib.notify({
                        title = 'Byens Jobcenter',
                        description = '***Du valgte Fisker, som dit nye arbejde! Tilykke***',
                        type = 'success'
                    })
                end,
                metadata = {
                    {label = '💲Indkomst', value = '500 DKK'},
                   -- {label = 'Du modtager jobbet som', value = 'Fisker'}
                  },
                event = 'fb_jobcenter:job6'
            },
            {
                title = 'Skovhugger', 
                icon = 'fa-solid fa-person',
                description = 'Du modtager jobbet som Skovhugger',
                onSelect = function(args)
                    lib.notify({
                        title = 'Byens Jobcenter',
                        description = '***Du valgte Skovhugger, som dit nye arbejde! Tilykke***',
                        type = 'success'
                    })
                end,
                metadata = {
                    {label = '💲Indkomst', value = '500 DKK'},
                   -- {label = 'Du modtager jobbet som', value = 'Skov hugger'}
                  },
                event = 'fb_jobcenter:job7'
            },
            --[[ Eksempel
            {
                title = 'Job navn', 
                description = 'Job beskrivelse',
                onSelect = function(args)
                    lib.notify({
                        title = 'Byens Jobcenter',
                        description = 'Du valgte Jobnavn, som dit nye arbejde! Tilykke',
                        type = 'success'
                    })
                end,
                event = 'job event'
            },
            --]]
        }
    })
    lib.showContext('jobcenter_menu')
end)



-- PED spawn 
Citizen.CreateThread(function()
    while true do
        if spawnped == true then
            spawnped = false
            RequestModel(GetHashKey('S_F_M_Shop_HIGH'))
            while not HasModelLoaded(GetHashKey('S_F_M_Shop_HIGH')) do
                Wait(1)
            end

            ped1 = CreatePed(4, GetHashKey('S_F_M_Shop_HIGH'), -547.7167, -209.1895, 36.6498, 211.9808, false, true) -- ændrer disse koordinater
            FreezeEntityPosition(ped1, true)
            SetEntityInvincible(ped1, true)
            SetBlockingOfNonTemporaryEvents(ped1, true)
        end
        Citizen.Wait(10000)
    end
end)


-- EventHandlers - opret en ny, når du tilføjer et nyt job under server.lua
AddEventHandler('fb_jobcenter:job1', function(job)
	TriggerServerEvent("fb_jobcenter:job1")
end)

AddEventHandler('fb_jobcenter:job2', function(job)
	TriggerServerEvent("fb_jobcenter:job2")
end)


AddEventHandler('fb_jobcenter:job3', function(job)
	TriggerServerEvent("fb_jobcenter:job3")
end)

AddEventHandler('fb_jobcenter:job4', function(job)
	TriggerServerEvent("fb_jobcenter:job4")
end)

AddEventHandler('fb_jobcenter:job5', function(job)
	TriggerServerEvent("fb_jobcenter:job5")
end)

AddEventHandler('fb_jobcenter:job6', function(job)
	TriggerServerEvent("fb_jobcenter:job6")
end)

AddEventHandler('fb_jobcenter:job7', function(job)
	TriggerServerEvent("fb_jobcenter:job7")
end)

-- Eksempel

--[[
AddEventHandler('fb_jobcenter:job4', function(job) HUSK OG ÆNDRE TALLERNE ALTSÅ (job4) HVERGANG DU LAVER EN NY!!
	TriggerServerEvent("fb_jobcenter:job4") HUSK OG ÆNDRE TALLERNE ALTSÅ (job4) HVERGANG DU LAVER EN NY!!
end)
--]]


-- Ikon på mappet
CreateThread(function()
	local blip = AddBlipForCoord(-547.7167, -209.1895, 37.6498) -- ændrer disse koordinater

	SetBlipSprite (blip, 475)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.7)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName('Byens Jobcenter')
	EndTextCommandSetBlipName(blip)
end)
        