-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use <tab> in normal mode to switch panes
vim.keymap.set("n", "<tab>", "<C-w>w")

-- Move by terminal lines
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Quickly clear search highlighting.
vim.keymap.set("n", "<leader>k", ":nohlsearch<CR>")

-- Close all open buffers.
vim.keymap.set("n", "<leader>Q", ":bufdo bdelete<CR>")
-- Reselect visual lines after indentation

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set("v", "y", "myy`y")
vim.keymap.set("v", "Y", "myY`y")

-- Paste replace visual selection without copying it.
vim.keymap.set("v", "p", '"_dP')

-- Disable annoying command line typo.
vim.keymap.set("n", "q:", ":q")

-- Paste replace visual selection without copying it.
vim.keymap.set("v", "p", '"_dP')

-- Move lines up and down using alt+j/k.
vim.keymap.set("i", "<A-j>", "<Esc>:move .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:move .-2<CR>==gi")
vim.keymap.set("n", "<A-j>", ":move .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv")

-- Close all open buffers.
vim.keymap.set("n", "<leader>Q", ":bufdo bdelete<CR>")
