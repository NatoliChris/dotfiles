-- Global settings
vim.cmd([[
  filetype indent on
]])

vim.opt.mouse = 'a'
vim.opt.cursorline = true
vim.opt.mousehide = true
vim.opt.backspace = 'indent,eol,start'
vim.cmd([[
  highlight clear SignColumn
]])
vim.g.mapleader = ","       -- Leader is ','
vim.opt.clipboard = "unnamedplus"
vim.opt.rulerformat = "%30(%=  %b%n%y%m%r%w %l,%c%V %P%)" -- Ruler on roids
vim.opt.showcmd = true      -- Show partial commands in status line and
-- Tabs and spaces
vim.opt.tabstop = 2         -- Tab spaces 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true    -- Tabs = spaces

-- Editor Settings
vim.opt.nu = true           -- Show line numbers
vim.opt.autoindent = true   -- Automatically indent
vim.opt.smartindent = true  -- Smart indent
vim.opt.colorcolumn = "80"  -- Highlight the 80th column (to show width)
vim.opt.showmatch = true    -- Show matching parens
vim.opt.incsearch = true    -- Find as you type
vim.opt.winminheight=0      -- Set 0 window line height
vim.opt.ignorecase = true   -- Ignore case sensitivity in search
vim.opt.smartcase = true    -- Only use capitals when explicitly searched
vim.opt.wildmenu = true     -- Show list instead of completion
vim.opt.scrolljump = 5      -- Lines to scroll when cursor leaves screen
vim.opt.scrolloff = 4       -- Minimum lines to keep below the cursor
vim.opt.whichwrap = "b,s,h,l,<,>,[,]"
vim.opt.foldenable = true
vim.opt.list = true
vim.opt.listchars = "tab:>\\ ,trail:.,extends:#,nbsp:." -- Problematic chars
vim.opt.updatetime = 50     -- Force quick reloads


-- Sessions
vim.g.session_directory = "~/.config/nvim/sessions"
vim.g.session_autoload = "no"
vim.g.session_autosave = "no"
vim.g.session_command_aliases = 1

-- Swapfiles and dir
-- Fix and initialise the directories
vim.api.nvim_exec([[
function! InitializeDirectories()
  let parent = $HOME
  let prefix = 'vim'
  let dir_list = {
        \ 'backup': 'backupdir',
        \ 'views': 'viewdir',
        \ 'swap': 'directory' }

  if has('persistent_undo')
    let dir_list['undo'] = 'undodir'
  endif

  if exists('g:spf13_consolidated_directory')
    let common_dir = g:spf13_consolidated_directory . prefix
  else
    let common_dir = parent . '/.' . prefix
  endif

  for [dirname, settingname] in items(dir_list)
    let directory = common_dir . dirname . '/'
    if exists("*mkdir")
      if !isdirectory(directory)
        call mkdir(directory)
      endif
    endif
    if !isdirectory(directory)
      echo "Warning: Unable to create backup directory: " . directory
      echo "Try: mkdir -p " . directory
    else
      let directory = substitute(directory, " ", "\\\\ ", "g")
      exec "set " . settingname . "=" . directory
    endif
  endfor
endfunction
call InitializeDirectories()
]], true)

-- Colours
vim.opt.termguicolors = true
vim.opt.guifont = "FantasqueSansMono Nerd Font 11"

-- Fix the status line
if vim.fn.has("statusline") == 1 then
  vim.opt.laststatus = 2

  -- Broken down into easily includeable segments
  vim.opt.statusline = "%<%f "                          -- Filename
  vim.opt.statusline = vim.opt.statusline + "%w%h%m%r"  -- Options
  vim.opt.statusline = vim.opt.statusline + " [%{&ff}/%Y]"            -- Filetype
  vim.opt.statusline = vim.opt.statusline + " [%{getcwd()}]"          -- Current dir
  vim.opt.statusline = vim.opt.statusline + "%=%-14.(%l,%c%V%) %p%%"  -- Right aligned file nav info

  vim.g.airline_theme = 'powerlineish'       -- airline users use the powerline theme
  vim.g.airline_powerline_fonts = 1          -- and the powerline fonts
end

-- Changing directories
vim.g.spf13_no_autochdir = 1

if vim.fn.exists("g:spf13_no_autochdir") == 0 then
  vim.cmd([[
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
  ]])
end

-- Remove the whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})
