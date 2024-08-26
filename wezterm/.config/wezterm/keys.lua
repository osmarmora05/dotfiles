local act = require('wezterm').action

return {
    -- Multiplex horizonal
    {
        key = 'Enter',
        mods = 'CTRL|SHIFT',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },

    -- Multiplex vertical
    {
        key = 'l',
        mods = 'CTRL|SHIFT',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },

    -- Kill multiplex
    {
        key = 'w',
        mods = 'CTRL|SHIFT',
        action = act.CloseCurrentPane { confirm = true },
    },

    -- Show debugger
    {
        key = 'h',
        mods = 'CTRL',
        action = act.ShowDebugOverlay
    }
}
