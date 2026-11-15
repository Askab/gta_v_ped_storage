-- Wednesday Addams (190 cm, Legacy) - replaces the vanilla ped u_f_y_bikerchic.
-- /wednesday : turns you into Wednesday.
local MODEL = 'u_f_y_bikerchic'

RegisterCommand('wednesday', function()
    local hash = joaat(MODEL)
    if not IsModelInCdimage(hash) then
        print(('[wednesday] %s not found'):format(MODEL))
        return
    end
    RequestModel(hash)
    local t = GetGameTimer()
    while not HasModelLoaded(hash) do
        if GetGameTimer() - t > 10000 then
            print('[wednesday] model could not be loaded (timeout)')
            return
        end
        Wait(50)
    end
    SetPlayerModel(PlayerId(), hash)
    SetModelAsNoLongerNeeded(hash)
    SetPedDefaultComponentVariation(PlayerPedId())
    print('[wednesday] model applied (190 cm, Legacy)')
end, false)
