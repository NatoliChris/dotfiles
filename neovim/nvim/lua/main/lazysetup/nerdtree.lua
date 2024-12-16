return {
  'preservim/nerdtree',
  lazy = false,
  opts = {},
  config = function()
    vim.keymap.set("n", "<C-n>", vim.cmd.NERDTreeToggle)
    vim.g.nerdtree_tabs_open_on_console_startup = 1
    vim.g.nerdtree_tabs_synchronize_view = 1
    vim.g.nerdtree_tabs_focus_on_files = 1
  end
}
