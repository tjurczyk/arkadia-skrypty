function alias_func_mapper_dirs_w()
    amap:keybind_pressed("west", false, true)
end

function alias_func_mapper_dirs_w_force_key()
    amap:keybind_pressed("west", true)
end

function alias_func_mapper_dirs_w_force()
    send("w", false)
end

function alias_func_mapper_dirs_sneaky_w()
    send(matches[2], false)

    if amap.mode ~= "off" then
        amap["went_sneaky"] = true
        amap:follow("west", false)
    end
end

function alias_func_mapper_dirs_e()
    amap:keybind_pressed("east", false, true)
end

function alias_func_mapper_dirs_e_force_key()
    amap:keybind_pressed("east", true)
end

function alias_func_mapper_dirs_e_force()
    send("e", false)
end

function alias_func_mapper_dirs_sneaky_e()
    send(matches[2], false)

    if amap.mode ~= "off" then
        amap["went_sneaky"] = true
        amap:follow("east", false)
    end
end

function alias_func_mapper_dirs_n()
    amap:keybind_pressed("north", false, true)
end

function alias_func_mapper_dirs_n_force_key()
    amap:keybind_pressed("north", true)
end

function alias_func_mapper_dirs_n_force()
    send("n", false)
end

function alias_func_mapper_dirs_sneaky_n()
    send(matches[2], false)

    if amap.mode ~= "off" then
        amap["went_sneaky"] = true
        amap:follow("north", false)
    end
end

function alias_func_mapper_dirs_s()
    amap:keybind_pressed("south", false, true)
end

function alias_func_mapper_dirs_s_force_key()
    amap:keybind_pressed("south", true)
end

function alias_func_mapper_dirs_s_force()
    send("s", false)
end

function alias_func_mapper_dirs_sneaky_s()
    send(matches[2], false)

    if amap.mode ~= "off" then
        amap["went_sneaky"] = true
        amap:follow("south", false)
    end
end

function alias_func_mapper_dirs_sw()
    amap:keybind_pressed("southwest", false, true)
end

function alias_func_mapper_dirs_sw_force_key()
    amap:keybind_pressed("southwest", true)
end

function alias_func_mapper_dirs_sw_force()
    send("sw", false)
end

function alias_func_mapper_dirs_sneaky_sw()
    send(matches[2], false)

    if amap.mode ~= "off" then
        amap["went_sneaky"] = true
        amap:follow("southwest", false)
    end
end

function alias_func_mapper_dirs_se()
    amap:keybind_pressed("southeast", false, true)
end

function alias_func_mapper_dirs_se_force_key()
    amap:keybind_pressed("southeast", true)
end

function alias_func_mapper_dirs_se_force()
    send("se", false)
end

function alias_func_mapper_dirs_sneaky_se()
    send(matches[2], false)

    if amap.mode ~= "off" then
        amap["went_sneaky"] = true
        amap:follow("southeast", false)
    end
end

function alias_func_mapper_dirs_nw()
    amap:keybind_pressed("northwest", false, true)
end

function alias_func_mapper_dirs_nw_force_key()
    amap:keybind_pressed("northwest", true)
end

function alias_func_mapper_dirs_nw_force()
    send("nw", false)
end

function alias_func_mapper_dirs_sneaky_nw()
    send(matches[2], false)

    if amap.mode ~= "off" then
        amap["went_sneaky"] = true
        amap:follow("northwest", false)
    end
end

function alias_func_mapper_dirs_ne()
    amap:keybind_pressed("northeast", false, true)
end

function alias_func_mapper_dirs_ne_force()
    amap:keybind_pressed("northeast", true)
end

function alias_func_mapper_dirs_ne_force()
    send("ne", false)
end

function alias_func_mapper_dirs_sneaky_ne()
    send(matches[2], false)

    if amap.mode ~= "off" then
        amap["went_sneaky"] = true
        amap:follow("northeast", false)
    end
end

function alias_func_mapper_dirs_u()
    amap:keybind_pressed("up", false, true)
end

function alias_func_mapper_dirs_u_force_key()
    amap:keybind_pressed("up", true)
end

function alias_func_mapper_dirs_u_force()
    send("u", false)
end

function alias_func_mapper_dirs_przemknij_u()
    send(matches[2], false)

    if amap.mode ~= "off" then
        amap["went_sneaky"] = true
        amap:follow("up", false)
    end
end

function alias_func_mapper_dirs_d()
    amap:keybind_pressed("down", false, true)
end

function alias_func_mapper_dirs_d_force_key()
    amap:keybind_pressed("down", true)
end

function alias_func_mapper_dirs_d_force()
    send("d", false)
end

function alias_func_mapper_dirs_przemknij_d()
    send(matches[2], false)

    if amap.mode ~= "off" then
        amap["went_sneaky"] = true
        amap:follow("down", false)
    end
end

