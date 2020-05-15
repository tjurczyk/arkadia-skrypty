scripts.character.combat_state = scripts.character.combat_state or {
    handlers = {},
    state = false,
}

function scripts.character.combat_state:init()
    for _, event_id in pairs(self.handlers) do
        scripts.event_register:kill_event_handler(event_id)
    end

    table.insert(self.handlers, scripts.event_register:register_event_handler("ateam_am_attacked", function(_, state) if state then self:start_combat() else self:end_combat() end end))
end

function scripts.character.combat_state:start_combat()
    self.state = true
    if self.timer then
        killTimer(self.timer)
    end
    self.command = false
    scripts.ui:info_combat_state_update(true)
end

function scripts.character.combat_state:end_combat()
    if self.state then
        self.time_after_combat = 30
        self.timer = tempTimer(1, function() self:update() end, true)
        self.state = false
        if self.trigger then
            killTrigger(self.trigger)
        end
        self.trigger = tempRegexTrigger("^(Ochlon troche po walce!|Ochlon troche od walki\\.\\.\\.)$", function()
            creplaceLine(matches[1] .. " <yellow>(" .. self:get_cooloff_timer() .. "s)<reset>")
            self.command = command
        end)
    end
    scripts.ui:info_combat_state_update(false, 30)
end

function scripts.character.combat_state:get_cooloff_timer()
    return self.time_after_combat
end

function scripts.character.combat_state:update()
    self.time_after_combat = self.time_after_combat - 1
    if self.time_after_combat == 0 then
        raiseEvent("cooledAfterCombat")
        killTimer(self.timer)
        killTrigger(self.trigger)
        if self.command then
            scripts.utils.bind_functional(self.command)
        end
        self.command = false
    end
    scripts.ui:info_combat_state_update(false, self.time_after_combat, self.command)
end

scripts.character.combat_state:init()