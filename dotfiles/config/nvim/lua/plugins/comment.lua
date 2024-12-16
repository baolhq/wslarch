return { -- Useful for toggle comment
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup({
				toggler = {
					line = "<leader>/", -- Normal mode line comment toggle
				},
				mappings = {
					basic = true, -- Enable basic mappings (gcc, gbc)
					extra = false, -- Disable extra mappings
				},
			})
		end,
	},
}
