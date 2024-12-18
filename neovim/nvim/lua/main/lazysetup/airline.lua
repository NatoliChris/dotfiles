return {
  "vim-airline/vim-airline",
  dependencies = {
    "vim-airline/vim-airline-themes"
  },
  opts = {
    airline_theme='bubblegum'
  },
  config = function()
    vim.g.airline_theme='bubblegum'
  end
}
