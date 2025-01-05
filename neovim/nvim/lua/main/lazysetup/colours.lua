function COLDARK()
  vim.opt.background = "dark"
  vim.cmd.colorscheme("base16-tomorrow-night")
end

function COLLIGHT()
  vim.opt.background = "light"
  vim.cmd.colorscheme("gruvbox")
end

vim.keymap.set("n", "<leader>zl", COLLIGHT, {})
vim.keymap.set("n", "<leader>zn", COLDARK, {})

-- vim.keymap.set("n", "<leader>zl", ":colorscheme base16-tomorrow<CR>")
-- vim.keymap.set("n", "<leader>zn", ":colorscheme base16-tomorrow-night<CR>")


return {
  {
    "chriskempson/base16-vim",
    lazy = false,
    opts = {},
    config = function()
      COLDARK()
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy= false,
    opts = {
      terminal_colors = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    },
    config = function()
    end
  }
}
