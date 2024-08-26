local act = require('wezterm').action

return {
    -- Paste with right click
    {
        event = { Up = { streak = 1, button = "Right" } },
        mods = "NONE",
        action = act.PasteFrom("PrimarySelection"),
    }
}