return { -- Fuzzy finder for files, grep, command etc..
	"ibhagwan/fzf-lua",
	-- optional for icon support
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({})
	end,
}
