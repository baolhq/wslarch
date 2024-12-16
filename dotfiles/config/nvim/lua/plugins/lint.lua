return { -- Linter configurations
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			markdown = { "markdownlint" },
			lua = { "luacheck" },
			rust = { "clippy" },
		}

		-- Preven luacheck from warning `vim` global variable
		lint.linters.luacheck = {
			cmd = "luacheck",
			stdin = true,
			args = {
				"vim",
			},
			ignore_exitcode = true,
			parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
				source = "luacheck",
			}),
		}

		-- Create autocommand which carries out the actual linting
		-- on the specified events.
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				if vim.opt_local.modifiable:get() then
					lint.try_lint()
				end
			end,
		})
	end,
}
