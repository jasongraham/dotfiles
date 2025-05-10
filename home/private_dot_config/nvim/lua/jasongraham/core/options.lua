vim.g.netrw_liststyle = 3

-- line numbers
vim.o.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
vim.o.tabstop = 4 -- 2 spaces for tabs (prettier default)
vim.o.shiftwidth = 4 -- 2 spaces for indent width
vim.o.expandtab = true -- expand tab to spaces
vim.o.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
vim.o.wrap = false -- disable line wrapping

-- search settings
vim.o.ignorecase = true -- ignore case when searching
vim.o.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
vim.o.cursorline = true -- highlight the current cursor line

-- appearance
vim.o.termguicolors = true
vim.o.background = "dark" -- colorschemes that can be light or dark will be made dark
vim.o.signcolumn = "yes" -- show sign column so that text doesn't shift
vim.o.colorcolumn = "100"

-- backspace
vim.o.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- Schedule the settings after 'UiEnter to reduce start-up time'
vim.schedule(function()
    vim.o.clipboard = "unnamedplus" -- use system clipboard as default register
end)

-- split windows
vim.o.splitright = true -- split vertical window to the right
vim.o.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
vim.o.swapfile = false
