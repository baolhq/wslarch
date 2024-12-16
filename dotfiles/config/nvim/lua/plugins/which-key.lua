return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			-- Disable which-key icons
			icons = {
				mappings = false,
			},
		})

		-- Insert comma/semicolon at the end of line
		wk.add({
			{ "<leader>,", "m`A,<Esc>``", desc = "Insert colon", hidden = true },
			{ "<leader>;", "m`A;<Esc>``", desc = "Insert semicolon", hidden = true },
		})

		-- [[ Lazy ]]
		local lazy = require("lazy")
		wk.add({
			{ "<leader>L", group = "Lazy" },
			{ "<leader>Li", lazy.show, desc = "Lazy info" },
			{ "<leader>Lc", lazy.check, desc = "Check plugins" },
			{ "<leader>Lu", lazy.update, desc = "Update plugins" },
			{ "<leader>Ld", lazy.debug, desc = "Debug" },
			{ "<leader>Ll", lazy.log, desc = "View log" },
			{ "<leader>Lh", lazy.help, desc = "Help" },
			{ "<leader>Lr", lazy.restore, desc = "Restore" },
			{ "<leader>Ls", lazy.sync, desc = "Sync plugins" },
		})

		-- [[ LSP ]]
		wk.add({
			{ "<leader>l", group = "LSP" },
			{ "<leader>la", vim.lsp.buf.code_action, desc = "Code action" },
			{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
		})

		-- [[ Debug ]]
		local dap = require("dap")
		local dapui = require("dapui")
		wk.add({
			{ "<leader>d", group = "Debug" },
			{ "<leader>ds", dap.continue, desc = "Start/Continue" },
			{ "<leader>di", dap.step_into, desc = "Step into" },
			{ "<leader>do", dap.step_over, desc = "Step over" },
			{ "<leader>du", dap.step_out, desc = "Step out" },
			{ "<leader>dt", dap.toggle_breakpoint, desc = "Toggle breakpoint" },
			{ "<leader>dU", dapui.toggle, desc = "Toggle UI" },
		})

		-- [[ Telescope ]]
		local telescope_builtin = require("telescope.builtin")
		wk.add({
			{ "<leader>s", group = "Search" },
			{ "<leader>sc", telescope_builtin.command_history, desc = "Command history" },
			{ "<leader>sh", telescope_builtin.help_tags, desc = "Help" },
			{ "<leader>sk", telescope_builtin.keymaps, desc = "Keymaps" },
			{ "<leader>sf", telescope_builtin.find_files, desc = "Search file" },
			{ "<leader>sr", telescope_builtin.resume, desc = "Recents" },
			{ "<leader>sg", telescope_builtin.live_grep, desc = "Live grep" },
			{ "<leader>sj", telescope_builtin.buffers, desc = "Jump to" },
			{ "<leader>sd", telescope_builtin.diagnostics, desc = "Diagnostics" },
			{ "<leader>sb", telescope_builtin.current_buffer_fuzzy_find, desc = "Current buffer" },
			{ "gd", telescope_builtin.lsp_definitions, desc = "Goto definition" },
			{ "gr", telescope_builtin.lsp_references, desc = "Goto references" },
			{ "gI", telescope_builtin.lsp_implementations, desc = "Goto implementation" },
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
			{ "<leader>r", group = "Rust" },
			{ "<leader>rr", "<cmd>!cargo run<CR>", desc = "Run: Debug" },
			{ "<leader>rb", "<cmd>!cargo build<CR>", desc = "Build: Debug" },
			{ "<leader>rl", "<cmd>!cargo build --release<CR>", desc = "Build: Release" },
			{ "<leader>rl", "<cmd>!cargo build --release<CR>", desc = "Build: Release" },
			{ "<leader>rc", "<cmd>!cargo check<CR>", desc = "Cargo: Check" },
			{ "<leader>ru", "<cmd>!cargo update<CR>", desc = "Cargo: Update" },
			{
				"<leader>ra",
				rhs = function()
					local pkg = vim.fn.input("Package to add: ")
					vim.cmd("!cargo add " .. pkg)
				end,
				desc = "Cargo: Add package",
			},
			{
				"<leader>rd",
				rhs = function()
					local pkg = vim.fn.input("Package to remove: ")
					vim.cmd("!cargo remove " .. pkg)
				end,
				desc = "Cargo: Remove package",
			},
		})
	end,
}
