local MODEL = 'goody_addams'

RegisterCommand('goody_addams', function()
    local hash = joaat(MODEL)
    if not IsModelInCdimage(hash) then
        print(('[mprped] %s not found'):format(MODEL))
        return
    end
    RequestModel(hash)
    local t = GetGameTimer()
    while not HasModelLoaded(hash) do
        if GetGameTimer() - t > 10000 then
            print('[mprped] model could not be loaded (timeout)')
            return
        end
        Wait(50)
    end
    
    SetPlayerModel(PlayerId(), hash)
    SetModelAsNoLongerNeeded(hash)
    
    -- EZZEL HELYETTESÍTETTÜK A HIBÁS FUNKCIÓT:
    -- Nem kényszerítjük a variációk betöltését, csak frissítjük a karaktert
    UpdatePedVariation(PlayerPedId())
    
    print(('[mprped] model applied: %s'):format(MODEL))
end, false)
