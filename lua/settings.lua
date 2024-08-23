local opt = vim.opt -- global/buffer/windows-scoped options
-----------------------------------------------------------
-- Главные
-----------------------------------------------------------

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
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.notify = require "notify"
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank { higroup = "IncSearch", timeout = 500 }
	end,
})
-- vim.cmd "language en_US"
