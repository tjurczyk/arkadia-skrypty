function amap:open_map()
    openMapWidget()
    if not scripts.config then
        self.profile_loaded_handler = scripts.event_register:force_register_event_handler(self.profile_loaded_handler, "profileLoaded", function()
            raiseEvent("mapOpenEvent")
        end, true)
    end
end
tempTimer(1, function() amap:open_map() end)

function amap:draw_mode_manual()
    amap.mode = "draw"
    amap.ui:mapper_mode(false)
end

function amap:mapper_off()
    amap.mode = "off"
    amap.ui:mapper_mode(false)
end

function amap:follow_mode(dont_set_position)
    amap.mode = "follow"

    if not dont_set_position then
        amap:set_position(amap.curr.id, true)
    end

    amap.ui:mapper_mode(true)
end

function amap:extract_gmcp()
    local tmp_loc = {}

    -- Collect x, y, z if exist
    if gmcp and gmcp.room and gmcp.room.info then
        if gmcp.room.info.map then
            if gmcp.room.info.map.x then
                tmp_loc["x"] = gmcp.room.info.map.x
            end
            if gmcp.room.info.map.y then
                tmp_loc["y"] = gmcp.room.info.map.y
            end
            if gmcp.room.info.map.z then
                tmp_loc["z"] = gmcp.room.info.map.z
            end
            if gmcp.room.info.map.name then
                tmp_loc["area"] = gmcp.room.info.map.name
            end
            if gmcp.room.info.exits then
                tmp_loc["exits"] = gmcp.room.info.exits
            end
        end

        if tmp_loc["x"] and not tmp_loc["z"] then
            tmp_loc["z"] = 0
        end

        -- Collect exits if exist
        if gmcp.room.info.exits then
            tmp_loc["exits"] = gmcp.room.info.exits
        end
    end

    return tmp_loc
end

function amap:keybind_pressed(dir, force, is_alias)
    if amap.mode == "off" then
        send(amap.walk_mode_to_prefix[amap.walk_mode] .. amap.long_to_short[dir], not is_alias)
        return
    end

    amap.dir_from_key = dir

    if amap.walk_mode ~= 1 then
        amap["went_sneaky"] = true
    end

    if amap.using_pre_walk_cmd ~= nil then
        amap:walk_cmd_execute(amap.using_pre_walk_cmd)
    end

    if amap.walker then
        amap:terminate_walker()
    end
    amap:pre_on_key_event(force, is_alias)
end

function amap:pre_on_key_event(force, is_alias)
    local went_special = amap:check_room_on_direction_of(amap.curr, amap.dir_from_key, force)
    --local went_special = nil
    if not went_special and amap.long_to_short[amap.dir_from_key]then
        send(amap.walk_mode_to_prefix[amap.walk_mode] .. amap.long_to_short[amap.dir_from_key], not is_alias)
        amap:on_key_event()
    else
        scripts.ui:info_hidden_update("")
    end

    if amap.using_post_walk_cmd ~= nil then
        amap:walk_cmd_execute(amap.using_post_walk_cmd)
    end
end

function amap:on_key_event()
    amap.created_room = false

    if amap.mode == "draw" then
        amap:add_room_manual()
    elseif amap.mode == "follow" then
        local dir = amap.dir_from_key
        dir = amap:trim_sneaky(dir)
        local ret_val = amap:follow(dir, false)
    end
end

function amap:move_backward()
    amap_step_back_perform()
end

