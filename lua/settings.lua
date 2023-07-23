local opt = vim.opt             -- global/buffer/windows-scoped options
local cmd = vim.cmd             -- execute Vim commands
local g = vim.g                 -- global variables

-----------------------------------------------------------
-- Главные
-----------------------------------------------------------


opt.cursorline = true               -- Подсветка строки с курсором
opt.number = true                   -- Включаем нумерацию строк
opt.relativenumber = true           -- Вкл. относительную нумерацию строк
opt.splitright = true               -- vertical split вправо
opt.so=999                          -- Курсор всегда в центре экрана
opt.splitbelow = true               -- horizontal split вниз
opt.expandtab = true                -- use spaces instead of tabs
opt.shiftwidth = 4                  -- shift 4 spaces when tab
opt.tabstop = 4                     -- 1 tab == 4 spaces
opt.smartindent = true              -- autoindent new lines
opt.mouse = nil                     -- Отключение курсора
opt.splitright = true               -- vertical split вправо
opt.splitbelow = true               -- horizontal split вниз


opt.termguicolors = true            --  24-bit RGB colors

