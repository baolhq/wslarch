return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			preset = "helix",
		})

		-- Insert comma/semicolon at the end of line
		wk.add({
			{ "<leader>,", "m`A,<Esc>``", desc = "Insert colon", hidden = true },
			{ "<leader>;", "m`A;<Esc>``", desc = "Insert semicolon", hidden = true },
		})

		-- [[ Lazy ]]
		local lazy = require("lazy")
		wk.add({
			{ "<leader>L", group = "Lazy", icon = "󰒲" },
			{ "<leader>Li", lazy.show, desc = "Lazy: Info" },
			{ "<leader>Lc", lazy.check, desc = "Lazy: Check" },
			{ "<leader>Lu", lazy.update, desc = "Lazy: Update" },
			{ "<leader>Ld", lazy.debug, desc = "Lazy: Debug" },
			{ "<leader>Ll", lazy.log, desc = "Lazy: Log" },
			{ "<leader>Lh", lazy.help, desc = "Lazy: Help" },
			{ "<leader>Lr", lazy.restore, desc = "Lazy: Restore" },
			{ "<leader>Ls", lazy.sync, desc = "Lazy: Sync" },
		})

		-- [[ LSP ]]
		wk.add({
			{ "<leader>l", group = "LSP", icon = "" },
			{ "<leader>la", vim.lsp.buf.code_action, desc = "Code action" },
			{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
			{ "<leader>ld", vim.diagnostic.open_float, desc = "Floating diagnostic" },
			{
				"<leader>lf",
				function()
					local conform = require("conform")
					conform.format({ async = true, lsp_format = "fallback" })
				end,
				desc = "Format buffer",
			},
		})

		-- [[ Debug ]]
		local dap = require("dap")
		local dapui = require("dapui")
		wk.add({
			{ "<leader>d", group = "Debug" },
			{ "<leader>ds", dap.continue, desc = "Start/Continue" },
			{ "<leader>do", dap.step_over, desc = "Step over" },
			{ "<leader>di", dap.step_into, desc = "Step into" },
			{ "<leader>du", dap.step_out, desc = "Step out" },
			{ "<leader>dt", dap.toggle_breakpoint, desc = "Toggle breakpoint" },
			{ "<leader>dU", dapui.toggle, desc = "Toggle UI" },
			{ "<F5>", dap.continue, desc = "Start/Continue" },
			{ "<F6>", dap.step_over, desc = "Step over" },
			{ "<F7>", dap.step_into, desc = "Step into" },
			{ "<F8>", dap.step_out, desc = "Step out" },
			{ "<F9>", dap.toggle_breakpoint, desc = "Toggle breakpoint" },
			{ "<F10>", dapui.toggle, desc = "Toggle UI" },
		})

		-- [[ Fuzzy finder ]]
		wk.add({
			{ "<leader>s", group = "Search" },
			{ "<leader>sa", "<cmd>FzfLua autocmds<CR>", desc = "Auto commands" },
			{ "<leader>sb", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
			{ "<leader>sc", "<cmd>FzfLua colorschemes<CR>", desc = "Colorschemes" },
			{ "<leader>sh", "<cmd>FzfLua command_history<CR>", desc = "Command history" },
			{ "<leader>ss", "<cmd>FzfLua search_history<CR>", desc = "Search history" },
			{ "<leader>sk", "<cmd>FzfLua keymaps<CR>", desc = "Keymaps" },
			{ "<leader>sf", "<cmd>FzfLua files<CR>", desc = "Files" },
			{ "<leader>sr", "<cmd>FzfLua oldfiles<CR>", desc = "Recents" },
			{ "<leader>sg", "<cmd>FzfLua live_grep<CR>", desc = "Live grep" },
			{ "<leader>sb", "<cmd>FzfLua lgrep_curbuf<CR>", desc = "Grep current buffer" },
		})

		-- [[ Dashboard ]]
		wk.add({
			{ "<leader><leader>", "<cmd>Dashboard<CR>", desc = "Dashboard", icon = "󰕮" },
		})

		-- [[ ToggleTerm ]]
		wk.add({
			{ "<leader>t", group = "Terminal" },
			{ "<leader>th", "<cmd>ToggleTerm<CR>", desc = "Toggle horizontal" },
			{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", desc = "Toggle vertical" },
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "Open floating" },
			{ "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", desc = "Toggle all" },
			{ "<Esc>", "<C-\\><C-n>", desc = "Exit terminal insert mode", mode = "t" },
		})

		-- [[ Comment ]]
		wk.add({
			{ "<leader>/", group = "Toggle comment" },
			{
				"<leader>/",
				rhs = function()
					local api = require("Comment.api")
					local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)

					vim.api.nvim_feedkeys(esc, "nx", false)
					api.toggle.linewise(vim.fn.visualmode())
				end,
				group = "Toggle comment",
				mode = "v",
			},
		})

		-- [[ BufferLine ]]
		local bufferline = require("bufferline")
		wk.add({
			{ "<leader>b", group = "Buffer" },
			{ "<leader>bb", "<cmd>bprev<CR>", desc = "Previous" },
			{ "<leader>bn", "<cmd>bnext<CR>", desc = "Next" },
			{ "<leader>bc", "<cmd>bd<CR>", desc = "Close" },
			{ "<leader>bj", bufferline.pick, desc = "Jump to" },
			{ "<leader>bp", bufferline.groups.toggle_pin, desc = "Toggle pin" },
			{ "<leader>bo", bufferline.close_others, desc = "Close others" },
			{ "<leader>bs", "<cmd>Telescope scope buffers<CR>", desc = "Find buffer" },
		})

		-- [[ Rust ]]
		wk.add({
			{ "<leader>r", group = "Rust", icon = "" },
			{ "<leader>rr", "<cmd>!cargo run<CR>", desc = "Run (debug)" },
			{ "<leader>rt", "<cmd>!cargo test<CR>", desc = "Run test" },
			{ "<leader>rb", "<cmd>!cargo build<CR>", desc = "Build (debug)" },
			{ "<leader>rl", "<cmd>!cargo build --release<CR>", desc = "Build (release)" },
			{ "<leader>rd", "<cmd>!cargo doc --open<CR>", desc = "Open docs" },
			{ "<leader>rc", "<cmd>!cargo check<CR>", desc = "Cargo check" },
			{ "<leader>ru", "<cmd>!cargo update<CR>", desc = "Update packages" },
			{
				"<leader>ra",
				rhs = function()
					local pkg = vim.fn.input("Package to add: ")
					if string.len(pkg) > 0 then
						vim.cmd("!cargo add " .. pkg)
					end
				end,
				desc = "Add package",
			},
			{
				"<leader>rm",
				rhs = function()
					local pkg = vim.fn.input("Package to remove: ")
					if string.len(pkg) > 0 then
						vim.cmd("!cargo remove " .. pkg)
					end
				end,
				desc = "Remove package",
			},
		})

		-- [[ Zen mode ]]
		local zm = require("zen-mode")
		wk.add({
			{ "<leader>u", group = "UI" },
			{ "<leader>uz", zm.toggle, desc = "Toggle zen mode" },
		})
	end,
}
