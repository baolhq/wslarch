return { -- Toggle multiple terminals during an editing session
	"akinsho/toggleterm.nvim",
	lazy = true,
	event = "VeryLazy",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 12
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.25
				end
			end,
			float_opts = {
				border = "curved",
				winblend = 1,
			},
			shade_terminals = false,
		})
	end,
}
