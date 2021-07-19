mudlet = mudlet or {}; mudlet.mapper_script = true
if not amap then
    amap = {
        handlers = {},
        db = { show_notes = true, show_binds = true },
        ver = scripts.ver,
        shortcuts = {},
        shorten_exits = false,
        dir_from_key = nil,
        curr = {},
        prev = {},
        backup_loc = {},
        mode = "follow",
        walker = false,
        -- Flaga ustawiana przy uruchamianiu chodzika przy uzyciu komend. Chodzi
        -- o to by rozroznic uruchomienie chodzika po klinieciu w mape (false)
        -- od swiadomego przez gracza uruchomienia po wpisaniu komendy (true)
        walker_set = false,
        walker_disabled = false,
        walker_on_map_click = true,
        set_walker_delay = 2,
        walker_delay = 2,
        walker_bind = nil,
        options = {
            ["skok_x"] = 2,
            ["skok_y"] = 2,
            ["laczenie_stubow"] = 2
        },
        walker_delta = 0.2,
        team_member = false,
        team_follow = false,
        locating = {},
        walk_mode = 1,
        using_room_gps = true,
        can_bind_enemies = true,
        next_dir_bind = nil,
        legacy_locate = false,
        disable_team_sneak = false,
    }
end

enableTrigger("room-gps")
function amap:check_room_gps_options()
    enableTrigger("room-gps")
    if amap.using_room_gps == false then
        disableTrigger("room-gps")
    end
end

amap.id_to_open_gate = {
    [14916] = "uderz w brame",
    [14917] = "uderz w brame",
    [1707] = "uderz w brame",
    [1706] = "uderz w brame",
    [15202] = "uderz w brame",
    [15203] = "uderz w brame",
}

amap.walk_mode_to_prefix = { "", "przemknij ", "przemknij z druzyna " }

amap.long_to_short = {
    ["north"] = "n",
    ["south"] = "s",
    ["east"] = "e",
    ["west"] = "w",
    ["northeast"] = "ne",
    ["northwest"] = "nw",
    ["southeast"] = "se",
    ["southwest"] = "sw",
    ["up"] = "u",
    ["down"] = "d"
}

amap.short_to_long = {
    ["n"] = "north",
    ["s"] = "south",
    ["e"] = "east",
    ["w"] = "west",
    ["ne"] = "northeast",
    ["nw"] = "northwest",
    ["se"] = "southeast",
    ["sw"] = "southwest",
    ["d"] = "down",
    ["down"] = "down",
    ["u"] = "up",
    ["up"] = "up"
}

amap.polish_to_english = {
    ["polnoc"] = "north",
    ["poludnie"] = "south",
    ["wschod"] = "east",
    ["zachod"] = "west",
    ["polnocny-wschod"] = "northeast",
    ["polnocny-zachod"] = "northwest",
    ["poludniowy-wschod"] = "southeast",
    ["poludniowy-zachod"] = "southwest",
    ["dol"] = "down",
    ["gora"] = "up",
    ["gore"] = "up"
}

amap.english_to_polish = {
    ["north"] = "polnoc",
    ["south"] = "poludnie",
    ["east"] = "wschod",
    ["west"] = "zachod",
    ["northeast"] = "polnocny-wschod",
    ["northwest"] = "polnocny-zachod",
    ["southeast"] = "poludniowy-wschod",
    ["southwest"] = "poludniowy-zachod",
    ["down"] = "dol",
    ["up"] = "gora"
}

amap.opposite_dir = {
    ["n"] = "s",
    ["s"] = "n",
    ["e"] = "w",
    ["w"] = "e",
    ["sw"] = "ne",
    ["se"] = "nw",
    ["nw"] = "se",
    ["ne"] = "sw",
    ["u"] = "d",
    ["d"] = "u",
    ["north"] = "s",
    ["south"] = "n",
    ["east"] = "w",
    ["west"] = "e",
    ["southwest"] = "ne",
    ["southeast"] = "nw",
    ["northwest"] = "se",
    ["northeast"] = "sw",
    ["up"] = "d",
    ["down"] = "u",
    ["gore"] = "d"
}

amap.opposite_exitmap = {
    [1] = 6,
    [2] = 8,
    [3] = 7,
    [4] = 5,
    [5] = 4,
    [6] = 1,
    [7] = 3,
    [8] = 2,
    [9] = 10,
    [10] = 9,
}

amap.exitmap = {
    n = 1,
    north = 1,
    ne = 2,
    northeast = 2,
    nw = 3,
    northwest = 3,
    e = 4,
    east = 4,
    w = 5,
    west = 5,
    s = 6,
    south = 6,
    se = 7,
    southeast = 7,
    sw = 8,
    southwest = 8,
    u = 9,
    up = 9,
    d = 10,
    down = 10,
    ["in"] = 11,
    out = 12,
    [1] = "north",
    [2] = "northeast",
    [3] = "northwest",
    [4] = "east",
    [5] = "west",
    [6] = "south",
    [7] = "southeast",
    [8] = "southwest",
    [9] = "up",
    [10] = "down",
    [11] = "in",
    [12] = "out",
}

local r, g, b = unpack(color_table.blue)
setCustomEnvColor(200, r, g, b, 255)
r, g, b = unpack(color_table.green)
setCustomEnvColor(201, r, g, b, 255)
r, g, b = unpack(color_table.red)
setCustomEnvColor(202, r, g, b, 255)
r, g, b = unpack(color_table.brown)
setCustomEnvColor(203, r, g, b, 255)

amap.color_table = {
    ["blue"] = 200,
    ["green"] = 201,
    ["red"] = 202,
    ["main"] = 257,
    ["yellow"] = 267,
    ["grey"] = 272,
    ["orange"] = 295,
}

amap.special_exits = {
    ["przecisnij sie przez krzaki"] = true,
    ["wejdz po linie"] = true,
    ["zejdz po linie"] = true,
    ["wespnij sie na drzewo"] = true,
    ["przedrzyj sie przez bluszcz"] = true,
    ["wejdz za najwiekszy krzak"] = true,
    ["przejdz przez furtke"] = true,
    ["zejdz na dol"] = true,
    ["wespnij sie na mur"] = true,
    ["wejdz po schodkach"] = true,
    ["zejdz po schodkach"] = true,
    ["wejdz na luk"] = true,
    ["zejdz na placyk"] = true,
    ["wejdz do studni"] = true,
    ["przecisnij sie przez otwor"] = true,
    ["przecisnij sie przez szczeline"] = true,
    ["przekrec czaszke"] = true,
    ["poklon sie statui"] = true,
    ["wsiadz do dylizansu"] = true,
    ["przejdz przez wodospad"] = true,
    ["wejdz w krzaki"] = true,
    ["wejdz do kurhanu"] = true,
    ["wespnij sie na gore"] = true,
    ["wejdz w otwor"] = true,
    ["wejdz na plyte"] = true,
    ["przeslizgnij sie miedzy beczkami"] = true,
    ["wejdz na drzewo"] = true,
    ["wejdz do pieczary"] = true,
    ["przeczolgaj sie na poludnie"] = true,
    ["przeczolgaj sie na polnoc"] = true,
    ["zsun sie na dol"] = true,
    ["podwaz czarny glaz"] = true,
    ["wespnij sie po linach"] = true,
    ["zsun sie po linie"] = true,
    ["wdrap sie na sciezke"] = true,
    ["zapukaj w skale"] = true,
    ["wespnij sie po scianie"] = true,
    ["wdrap sie po korzeniu"] = true,
    ["wejdz po schodach"] = true,
    ["skocz do stawu"] = true,
    ["wejdz na most"] = true,
    ["przeplyn na polnoc"] = true,
    ["przeplyn na poludnie"] = true,
    ["wejdz na prom"] = true,
    ["zejdz"] = true,
    ["wejdz na tratwe"] = true,
    ["wespnij sie na barak"] = true,
    ["przeskocz palisade"] = true,
    ["otworz klape"] = true,
    ["wskocz do jamy"] = true,
    ["wdrap sie na gore"] = true,
    ["nacisnij kamien"] = true,
    ["zejdz pod most"] = true,
    ["wespnij sie na most"] = true,
    ["odsun kamienna plyte"] = true,
    ["otworz wrota"] = true,
    ["przecisnij sie obok drzewa"] = true,
    ["wejdz do komina"] = true,
    ["zejdz na dol po drabinie"] = true,
    ["przeskocz wyrwe"] = true,
    ["wejdz do otworu"] = true,
    ["przejdz przez strumien"] = true,
    ["przejdz za glaz"] = true,
    ["zejdz nad strumien"] = true,
    ["wejdz na podest"] = true,
    ["wejdz do grobowca"] = true,
    ["wejdz w sciane"] = true,
    ["zeskocz na glaz"] = true,
    ["wskocz do wody"] = true,
    ["zanurkuj pod wode"] = true,
    ["wespnij sie do gory"] = true,
    ["obroc rzezbe"] = true,
    ["wsiadz na statek"] = true,
    ["zejdz po drabinie"] = true,
    ["wejdz po drabinie"] = true,
    ["przejdz przez wneke"] = true,
    ["wejdz do baszty"] = true,
    ["wejdz do czerwonego wozu"] = true,
    ["zejdz po drabince"] = true,
    ["wdrap sie na glaz"] = true,
    ["wespnij sie na polke"] = true,
    ["przeplyn rzeke"] = true,
    ["wejdz w szczeline"] = true,
    ["wdrap sie na polke"] = true,
    ["zeskocz na dol"] = true,
    ["wejdz do krypty"] = true,
    ["wslizgnij sie do otworu"] = true,
    ["zejdz do rozpadliny"] = true,
    ["wejdz do chaty"] = true,
    ["wejdz do alkierza"] = true,
    ["wejdz do namiotu"] = true,
    ["zejdz po pniu"] = true,
    ["wejdz za paki"] = true,
    ["wejdz po stopniach"] = true,
    ["wespnij sie po pniu"] = true,
    ["przecisnij sie na polnoc"] = true,
    ["przecisnij sie na poludnie"] = true,
    ["przecisnij sie przez gaszcz"] = true,
    ["wejdz na gore"] = true,
    ["zejdz z tratwy"] = true,
    ["przecisnij sie pod pniem"] = true,
    ["zejdz do szybu"] = true,
    ["wejdz do sarkofagu"] = true,
    ["przeskocz przepasc"] = true,
    ["zejdz po zboczu"] = true,
}

function trigger_func_mapper_jedziesz_wozem()
    tempTimer(0.07, function() amap:locate(true) end)
end

function trigger_func_mapper_idziesz()
        registerAnonymousEventHandler("gmcp.room.info", function() amap:locate(true) end, true)
        local exits = {}
        if table.size(gmcp.room.info.exits) ~= 2 then
            -- in rare cases if go command was executed and gmcp does not have 2 exits we have to
            -- use mapper exits
            for dir,_ in pairs(getRoomExits(amap.curr.id)) do
                table.insert(exits, amap.english_to_polish[dir])
            end
        else
            exits = gmcp.room.info.exits
        end

        if table.size(exits) > 2 or table.size(exits) == 0 then
            return
        end

        -- get direction that we came from (in polish)
        local en_opposite_long = amap.opposite_dir[amap.dir_from_key]
        local pl_long_dir = amap.english_to_polish[amap.short_to_long[en_opposite_long]]

        -- get from determined exits other direction to one that we came from
        if exits[1] == pl_long_dir then
            amap.last_go_dir = exits[2]
        else
            amap.last_go_dir = exits[1]
        end

        amap.dir_from_key = amap.polish_to_english[amap.last_go_dir]
        amap:follow(amap.dir_from_key, false)
end

function alias_func_mapper_print_options()
    amap:print_options_values()
end

function alias_func_mapper_set_option()
    amap:set_option(matches[2], matches[3])
end

function alias_func_mapper_print_help()
    amap:print_help()
end

function alias_func_mapper_print_options_help()
    amap:print_options()
end

function alias_func_mapper_print_draw_help()
    amap:print_draw()
end

function alias_func_mapper_print_shortcut_help()
    amap:print_shortcuts()
end

function alias_func_mapper_show_colors()
    amap:show_colors()
end

function alias_func_mapper_idz_do_id()
    if scripts then
        scripts.people.go_to_person_location(tonumber(matches[2]), nil)
    end
end

function alias_func_mapper_idz_do_id_delay()
    if scripts then
        scripts.people.go_to_person_location(tonumber(matches[2]), tonumber(matches[3]))
    end
end

function alias_func_mapper_drink_bind()
    amap:drinking_bind()
end

function alias_func_mapper_step_back_bind()
    amap_step_back_perform()
end

function alias_func_mapper_sciezka()
    amap:show_path(tonumber(matches[2]))
end

function alias_func_mapper_nastepny_kierunek()
    amap:execute_next_direction_bind()
end

