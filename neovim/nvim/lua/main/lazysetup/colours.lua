function ColourMe(colour)
	colour = colour or "base16-tomorrow-night"
	vim.cmd.colorscheme(colour)

end

vim.keymap.set("n", "<leader>zl", ":colorscheme base16-tomorrow<CR>")
vim.keymap.set("n", "<leader>zn", ":colorscheme base16-tomorrow-night<CR>")


return {
  "chriskempson/base16-vim",
  lazy = false,
  opts = {},
  config = function()
    ColourMe()
  end
}
