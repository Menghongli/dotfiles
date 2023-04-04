vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n","<leader>r", ":set relativenumber!<CR>")

vim.keymap.set("n","<leader>w", ":w!<cr>")
vim.keymap.set("n","<leader>sv", ":so $MYVIMRC<cr>")
vim.keymap.set("n", "<leader>ev", "<C-w><C-v><C-l>:e $MYVIMRC<cr>")

vim.keymap.set("i", "jj", "<ESC>")

vim.keymap.set("n", "<leader>q", "<C-w><C-v><C-l>:e ./buffer<cr>")

vim.keymap.set("n", "0", "^")

vim.keymap.set("n", "<leader>sa", "ggVG")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<space>", "/")

-- Navigator
vim.keymap.set({'n', 't'}, '<C-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({'n', 't'}, '<C-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({'n', 't'}, '<C-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({'n', 't'}, '<C-j>', '<CMD>NavigatorDown<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
