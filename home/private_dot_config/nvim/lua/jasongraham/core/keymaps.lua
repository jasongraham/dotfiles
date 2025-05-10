-- set leader key to space
vim.g.mapleader = ","

local map = function(keys, func, desc, mode)
    mode = mode or "n"
    vim.keymap.set(mode, keys, func, { desc = desc })
end

---------------------
-- General Keymaps -------------------

-- clear search highlights
map("<leader>/", ":nohl<CR>", "Clear search highlights")

-- window management
map("<leader>to", "<cmd>tabnew<CR>", "Open new tab")
map("<leader>tx", "<cmd>tabclose<CR>", "Close current tab")
map("<leader>tn", "<cmd>tabn<CR>", "Go to next tab")
map("<leader>tp", "<cmd>tabp<CR>", "Go to previous tab")
map("<leader>tf", "<cmd>tabnew %<CR>", "Open current buffer in new tab")
