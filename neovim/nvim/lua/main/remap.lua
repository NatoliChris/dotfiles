vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected text up/down
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Join lines with just Capital J
vim.keymap.set("n", "J", "mzJ`z")

-- Keep half page scroll in middle of screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search next/prev always in middle of screen.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over highlighted word WITHOUT losing buffer <HOLY SHIT>
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Leader to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Change the current working directories
vim.keymap.set("c", "cwd", "lcd %:p:h")
vim.keymap.set("c", "cd.", "lcd %:p:h")
