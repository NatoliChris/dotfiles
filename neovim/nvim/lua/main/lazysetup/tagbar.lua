return {
  "preservim/tagbar",
  opts = {},
  config = function()
    vim.keymap.set("n", "<C-Tab>", ":TagbarToggle<CR>")
  end
}
