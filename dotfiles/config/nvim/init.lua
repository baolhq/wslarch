-- Set <space> as the leader key
vim.g.mapleader = " "

-- Set nerd font to false if you have it
vim.g.have_nerd_font = true

-- Sourcing other configs
require("options")
require("keymaps")
require("lazy-bootstrap")
require("lazy-plugins")
require("autocmd")
