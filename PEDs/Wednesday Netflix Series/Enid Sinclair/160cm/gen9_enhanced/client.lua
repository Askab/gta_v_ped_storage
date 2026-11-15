local MODEL = 'a_f_y_hipster_01'

RegisterCommand('enid', function()
    local hash = joaat(MODEL)
    if not IsModelInCdimage(hash) then
        print(('[enid] %s not found'):format(MODEL))
        return
    end
    RequestModel(hash)
    local t = GetGameTimer()
    while not HasModelLoaded(hash) do
        if GetGameTimer() - t > 10000 then
            print('[enid] model could not be loaded (timeout)')
            return
        end
        Wait(50)
    end
    SetPlayerModel(PlayerId(), hash)
    SetModelAsNoLongerNeeded(hash)
    SetPedDefaultComponentVariation(PlayerPedId())
    print(('[enid] model applied: %s'):format(MODEL))
end, false)
