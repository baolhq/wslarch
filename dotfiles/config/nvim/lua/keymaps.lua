-- [[ Basic Keymaps ]]

-- Don't repeat yourself
local map = function(keys, func, desc, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Remap escape
map("jk", "<Esc>", "Escape", "i")

-- Clear highlights on search when pressing <Esc> in normal mode
map("<Esc>", "<cmd>nohlsearch<CR>", "No highlights")

-- Better save and quit
map("<leader>w", "<cmd>w<CR>", "Write buffer")
map("<leader>q", "<cmd>q<CR>", "Quit")

-- Split window
map("sh", "<cmd>split<CR>", "Split horizontally")
map("sv", "<cmd>vsplit<CR> ", "Split vertically")

-- Keybinds to make split navigation easier.
map("<C-h>", "<C-w><C-h>", "Focus left window")
map("<C-l>", "<C-w><C-l>", "Focus right window")
map("<C-j>", "<C-w><C-j>", "Focus lower window")
map("<C-k>", "<C-w><C-k>", "Focus upper window")
