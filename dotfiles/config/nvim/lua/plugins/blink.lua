return { -- Blazingly fast nvim-cmp replacement
	"saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally
	dependencies = "rafamadriz/friendly-snippets",
	version = "v0.*",
	opts = {
		keymap = { preset = "super-tab" },

		appearance = {
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, via `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			-- optionally disable cmdline completions
			-- cmdline = {},
		},

		-- experimental signature help support
		-- signature = { enabled = true }
	},
	-- allows extending the providers array elsewhere in your config
	-- without having to redefine it
	opts_extend = { "sources.default" },
}
