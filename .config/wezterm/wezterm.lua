local wezterm = require 'wezterm'
local config = {}

-- Nushell
config.default_prog = { '/bin/nu' }

-- Catppuccin
config.color_scheme = 'Catppuccin Frappe'

-- Font Size
config.font_size = 10

-- Tab Bar
config.window_decorations = "RESIZE"
config.window_frame = {
	active_titlebar_bg = "#303446"
}
config.colors = {
	tab_bar = {
		active_tab = {
			fg_color = "#c6d0f5",
			bg_color = "#232634"
		},
		inactive_tab = {
			fg_color = "#b5bfe2",
			bg_color = "#303446"
		},
		inactive_tab_hover = {
			fg_color = "#232634",
			bg_color = "#ca9ee6"
		},
		new_tab = {
			fg_color = "#c6d0f5",
			bg_color = "#303446"
		},
		new_tab_hover = {
			fg_color = "#232634",
			bg_color = "#ca9ee6"
		},
	}
}

return config

