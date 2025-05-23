local wezterm = require 'wezterm'
local config = {}

-- Checks if currently running on fedora
-- Much of my workflow on Silverblue involves using Arch in Distrobox, so special handling is required 
local is_fedora = wezterm.hostname() == 'fedora'

-- Nushell
local cmd = { '/bin/nu' }
if is_fedora then
	-- If on Silverblue, enter Arch first 
	cmd = { 'distrobox', 'enter', 'arch', '--', 'nu' }
end
config.default_prog = cmd

-- Catppuccin
config.color_scheme = 'Catppuccin Frappe'

-- Font Size
config.font_size = 10

-- Window Close Confirmation
config.window_close_confirmation = "NeverPrompt"
if is_fedora then
	wezterm.on(
		'mux-is-process-stateful', 
		function(proc)
			-- Never prompt
			-- Maybe make less bad in the future
			return false
		end
	)
end

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

