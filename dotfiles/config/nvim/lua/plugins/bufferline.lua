return { -- A snazzy buffer line (with tabpage integration)
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			tab_size = 24,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Explorer",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
}
