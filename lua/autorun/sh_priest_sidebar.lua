if SERVER then
    resource.AddFile('materials/vgui/ttt/hud_icon_brotherhood.png')
    resource.AddFile('materials/vgui/ttt/hud_icon_holy_deagle.png')
end

if CLIENT then
    local function TimeOutCounter()
        if not PRIEST_DATA.local_priest.time then return '-' end

        return tostring(math.Round(PRIEST_DATA.local_priest.time - CurTime(), 0))
    end
    hook.Add('Initialize', 'ttt2_role_priest_init', function() 
        STATUS:RegisterStatus('ttt2_role_priest_brotherhood', {
            hud = Material('vgui/ttt/hud_icon_brotherhood.png'),
            type = 'good'
        })
        STATUS:RegisterStatus('ttt2_role_priest_holy_deagle', {
            hud = Material('vgui/ttt/hud_icon_holy_deagle.png'),
            type = 'bad',
            DrawInfo = TimeOutCounter
        })
    end)
end