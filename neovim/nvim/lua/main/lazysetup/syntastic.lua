return {
  "vim-syntastic/syntastic",
  lazy = false,
  opts = {},
  config = function()
    vim.opt.statusline = vim.opt.statusline + "%f"

    vim.opt.statusline = vim.opt.statusline + "%#warningmsg#"
    vim.opt.statusline = vim.opt.statusline + "%{SyntasticStatuslineFlag()}"
    vim.opt.statusline = vim.opt.statusline + "%*"
    vim.g.syntastic_always_populate_loc_list = 1
    vim.g.syntastic_auto_loc_list = 0
    vim.g.syntastic_check_on_open = 1
    vim.g.syntastic_check_on_wq = 0
    vim.g.syntastic_python_flake8_args ='--ignore=E402,E501,E711'
    vim.g.syntastic_python_pyflakes_args ='--ignore=E402'
    vim.g.syntastic_sh_shellcheck_args ='-x'
    vim.g.syntastic_c_compiler_options ='--std=c11'
    vim.g.syntastic_javascript_eslint_exe = './node_modules/.bin/eslint'
    vim.g.syntastic_javascript_checkers = {'eslint'}
    vim.g.syntastic_go_checkers = {'go'}
    vim.g.syntastic_rust_checkers = {'cargo'}
    vim.g.rust_cargo_check_tests = 1
  end
}
