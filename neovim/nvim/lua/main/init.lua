-- Require Lazy to be installed
require("main.lazy")
-- Require remap file for remapping keys
require("main.remap")
-- Require set file which will set vim variables
require("main.set")


-- Create the group of files (all) as a general catchall
local main_group = vim.api.nvim_create_augroup('AllFilesGroup', {})

-- Shortcut for autocmd
local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufWritePre"}, {
  group = main_group,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- On the LSP load, send it these key remaps
autocmd('LspAttach', {
  group = main_group,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  end
})

-- Final configs
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
