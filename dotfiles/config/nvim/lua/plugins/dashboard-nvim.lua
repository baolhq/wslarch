return { -- Dashboard page for neovim
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	opts = {
		theme = "hyper",
		config = {
			header = {
				" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
				" ████╗  ██║██╔════╝██╔══ ██═██║   ██║██║████╗ ████║",
				" ██╔██╗ ██║█████╗  ██║   ██╗██║   ██║██║██╔████╔██║",
				" ██║╚██╗██║██╔══╝  ██║   ██║██║   ██║██║██║╚██╔╝██║",
				" ██║ ╚████║███████╗╚██████╔╝╚██████╔╝██║██║ ╚═╝ ██║",
				" ╚═╝  ╚═══╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝     ╚═╝",
				"                                                   ",
			},
			week_header = { enabled = true },
			shortcut = {
				{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
				{
					icon = " ",
					icon_hl = "@variable",
					desc = "Files",
					group = "Label",
					action = "FzfLua files",
					key = "f",
				},
				{
					desc = " Apps",
					group = "DiagnosticHint",
					action = "Telescope app",
					key = "a",
				},
				{
					desc = " dotfiles",
					group = "Number",
					action = "Telescope dotfiles",
					key = "d",
				},
			},
			footer = {
				"               ",
				"Happy coding 💤",
			},
		},
	},
}
