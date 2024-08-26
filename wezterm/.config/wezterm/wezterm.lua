local wezterm = require('wezterm')

-- Color scheme with different names. This makes it easier to modify awesomewm configuration lines.
-- https://github.com/osmarmora05/dotfiles
local themes = {
    ['everblush'] = 'Everblush',
    ['everforest'] = 'Everforest Dark (Gogh)',
    ['tokyonight'] = 'tokyonight_moon',
    ['catppuccin'] = 'Catppuccin Macchiato (Gogh)',
    ['dracula'] = 'Dracula (Gogh)',
    ['nord'] = 'Nord (Gogh)',
    ['gruvbox_dark'] = 'Gruvbox dark, soft (base16)',
    ['gruvbox_light'] = 'Gruvbox (Gogh)',
    ['solarized_dark'] = 'Builtin Solarized Dark',
    ['solarized_light'] = 'Builtin Solarized Light',
    ['sexy'] = 's3r0 modified (terminal.sexy)',
    ['dark-decay'] = 'dark-decay',
    ['clean'] = 'clean',
    ['adwaita'] = 'adwaita',
    ['janleigh'] = 'janleigh',
    ['ephemeral'] = 'ephemeral',
    ['amarena'] = 'amarena',
    ['mar'] = 'mar',
    ['wave'] = 'wave',
    ['plata'] = 'plata',
    ['rose'] = 'rose-pine',
    ['skyfall'] = 'skyfall',
    ['default'] = 'default',
    ['fullerene'] = 'fullerene',
    ['biscuit'] = 'biscuit',
    ['oxocarbon'] = 'oxocarbon'
}

return {

    -- Color Scheme
    color_scheme                =  themes['dark-decay'],

    color_schemes                = {
        ['Builtin Solarized Dark'] = {
            background = '#073642'
        },
        ['Builtin Solarized Light'] = {
            background = '#FDF6E3'
        },
        ['Nord (Gogh)'] = {
            background = '#2e3440'
        }
    },

    -- Shell
    default_prog                 = { 'fish' },

    -- Fonts
    font                         = wezterm.font_with_fallback {
        'CaskaydiaCove NF',
        --'Iosevka Nerd Font',
        'Symbols Nerd Font',
    },
    font_size                    = 13,
    harfbuzz_features            = { 'calt=1', 'clig=1', 'liga=1' },

    -- Window
    window_padding               = {
        left = '24pt',
        right = '24pt',
        bottom = '24pt',
        top = '24pt'
    },
    window_background_opacity    = 0.85,

    -- Tabbar
    enable_tab_bar               = true,
    use_fancy_tab_bar            = false,
    hide_tab_bar_if_only_one_tab = true,

    -- Autofocus
    pane_focus_follows_mouse     = true,

    inactive_pane_hsb            = {
        saturation = 1,
        brightness = 0.99,
    },

    -- Miscelaunus
    default_cursor_style         = 'SteadyBar',
    enable_wayland = false,

    --Keybinds
    keys                         = require('keys'),

    --Mouse_bindings
    mouse_bindings               = require('mouse_bindings')
}
