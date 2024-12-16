return {
  {
    "vim-airline/vim-airline",
    dependencies = {
      "vim-airline/vim-airline-themes"
    },
    opts = {},
    config = function()
      vim.cmd.AirlineTheme("bubblegum")
    end
  },
  "itchyny/lightline.vim",
}
