return {
    "mbbill/undotree",
    lazy = true,
    opts = {},
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
}
