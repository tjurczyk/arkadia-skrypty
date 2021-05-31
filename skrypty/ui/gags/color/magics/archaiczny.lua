function trigger_func_skrypty_ui_gags_moje_ciosy_archaiczny(value)
    scripts.gags:gag(value, 6, "moje_ciosy")
end

function trigger_func_skrypty_ui_gags_archaiczny_innych(value)
    local target = rex.match(getCurrentLine(), "\\b(?:ciebie|cie|ci)\\b") and "innych_ciosy_we_mnie" or "innych_ciosy"
    scripts.gags:gag(value, 6, target)
end