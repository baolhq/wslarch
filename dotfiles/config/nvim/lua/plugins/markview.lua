return {
	"OXY2DEV/markview.nvim",
	ft = "markdown",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local wk = require("which-key")

		-- markview.nvim
		wk.add({
			{ "<leader>m", group = "Markview", cond = vim.bo.filetype == "markdown" },
			{ "<leader>mt", "<cmd>Markview splitToggle<CR>", desc = "Toggle preview" },
			{ "<leader>me", "<cmd>Markview enable<CR>", desc = "Enable live preview" },
			{ "<leader>md", "<cmd>Markview disable<CR>", desc = "Disable live preview" },
		})
	end,
}
