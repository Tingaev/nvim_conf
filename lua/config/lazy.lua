local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local opt = vim.opt
opt.showmode = false
opt.cursorline = true -- Подсветка строки с курсором
opt.number = true -- Включаем нумерацию строк
opt.relativenumber = true -- Вкл. относительную нумерацию строк
opt.splitright = true -- vertical split вправо
opt.so = 999 -- Курсор всегда в центре экрана
opt.splitbelow = true -- horizontal split вниз
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines
opt.mouse = nil -- Отключение курсора
opt.splitright = true -- vertical split вправо
opt.splitbelow = true -- horizontal split вниз

opt.termguicolors = true --  24-bit RGB colors

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank { higroup = "IncSearch", timeout = 500 }
	end,
})
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	pattern = { "*" },
	command = "silent! wall",
	nested = true,
})

-- vim.cmd "language en_US"
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ufo setting
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -4<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", "\"_dP", opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

keymap("n", "<leader>j", "<cmd>cnext<CR>", { desc = "Forward QFL" })
keymap("n", "<leader>k", "<cmd>cprev<CR>", { desc = "Backward QFL" })

keymap("n", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
keymap("v", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })

-- From WhichKey
keymap("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit" })
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No Highlight" })

keymap("n", "<leader>ln", "<cmd>set number norelativenumber<cr>", { desc = "Norelative number" })
keymap("n", "<leader>lr", "<cmd>set number relativenumber<cr>", { desc = "Relative number" })

local bindings = {
	"<Up>",
	"<Down>",
	"<Left>",
	"<Right>",
}

for _, binding in ipairs(bindings) do
	vim.api.nvim_set_keymap("n", binding, "<Nop>", {})
end

require("lazy").setup {
	spec = {
		{ import = "plugins" },
	},
	checker = {
		enabled = false,
		concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		notify = false, -- get a notification when new updates are found
		frequency = 3600, -- check for updates every hour
		check_pinned = false, -- check for pinned packages that can't be updated
	},
	change_detection = {
		enabled = true,
		notify = false, -- get a notification when changes are found
	},
}

