require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Plugins
    use 'vim-airline/vim-airline-themes'
    use 'rking/ag.vim'
    use 'kien/ctrlp.vim'
    use 'w0rp/ale'
    use 'tpope/vim-commentary'
    use 'ervandew/supertab'
    use 'flazz/vim-colorschemes'
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'
    use 'mbbill/undotree'
    use 'fatih/vim-go'
    use 'neoclide/coc.nvim'
    use 'lifepillar/vim-solarized8' -- Modern Solarized theme with better Neovim compatibility

    -- Airline Settings
    use {'vim-airline/vim-airline', config = function()
        -- Airline Settings
        vim.g.airline.extensions.tabline.enabled = 1
        vim.g.airline_theme = 'papercolor'
        vim.g.airline_powerline_fonts = 1
    end}

    use {
      "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }
end)

-- Leader Key
vim.g.mapleader = ','

-- Colorscheme
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.cmd('colorscheme solarized8')

-- Basic Settings
vim.o.syntax = 'enable'
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.number = true
vim.o.filetype = 'on'
vim.o.wildmenu = true
vim.o.wildmode = 'list:longest,full'
vim.o.showmatch = true
vim.o.colorcolumn = '80'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.swapfile = false
vim.o.autoread = true
vim.o.backspace = 'eol,start,indent'
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.laststatus = 2
vim.o.hidden = true
vim.o.ai = true
vim.o.si = true
vim.o.list = true
vim.o.listchars = 'tab:┊ ,trail:-,extends:>,precedes:<,nbsp:+'
vim.o.errorbells = false
vim.o.visualbell = false
vim.o.maxmempattern = 10000
vim.o.shell = 'bash'

-- CtrlP Settings
vim.g.ctrlp_match_window = 'bottom,order:ttb'
vim.g.ctrlp_switch_buffer = 0
vim.g.ctrlp_working_path_mode = 0
vim.g.ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
vim.g.ctrlp_cmd = 'CtrlPMixed'

if vim.fn.executable('matcher') == 1 then
    vim.g.ctrlp_match_func = { match = require('ctrlp.matcher').match }
end

-- Go Settings
vim.g.go_fmt_command = "goimports"
vim.g.go_template_autocreate = 0

-- Keymaps (Some examples, you'll likely need to adjust these)
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sl', ':rightbelow vnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>a', ':Ag<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bp', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bn', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b<space>', ':CtrlPBuffer<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })

-- Disable Arrow Keys
vim.api.nvim_set_keymap('', '<up>', '<nop>', { noremap = true })
vim.api.nvim_set_keymap('', '<down>', '<nop>', { noremap = true })
vim.api.nvim_set_keymap('', '<left>', '<nop>', { noremap = true })
vim.api.nvim_set_keymap('', '<right>', '<nop>', { noremap = true })

-- Jinja Files
vim.api.nvim_create_augroup('filetype', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '*.jinja',
    command = 'set filetype=jinja',
    group = 'filetype',
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'jinja',
    command = 'set noexpandtab',
})

-- COC Config
vim.o.updatetime = 300

-- COC Keymaps
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Neotree toggle
vim.api.nvim_set_keymap('n', '<leader>f', ':Neotree toggle<CR>', { noremap = true, silent = true })
