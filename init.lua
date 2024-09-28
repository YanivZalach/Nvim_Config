local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- Initialize LazyVim
require('lazy').setup({
    'wbthomason/packer.nvim', -- Packer can manage itself
    'vim-airline/vim-airline', -- Status bar
    'vim-airline/vim-airline-themes', -- Color scheme for Status bar
    'navarasu/onedark.nvim', -- Color scheme - onedark
    'tpope/vim-fugitive', -- Git integration
    'nvim-lua/plenary.nvim', -- Dependency for telescope
    'nvim-tree/nvim-web-devicons', -- Devicons for telescope
    {'nvim-telescope/telescope.nvim', tag = '0.1.2'}, -- Telescope - fuzzy search
    'ThePrimeagen/harpoon', -- Harpoon - better local marks
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}, -- Treesitter - better syntax highlighting
    {'neoclide/coc.nvim', branch = 'release'}, -- Auto complete
})

-- Basic Settings
vim.opt.compatible = false
vim.opt.visualbell = true
vim.opt.encoding = 'utf-8'
vim.opt.spell = true
vim.opt.smarttab = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.showmatch = true
vim.opt.history = 1000
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmenu = true
vim.opt.nobackup = true
vim.opt.path:append('**')
vim.opt.wildignore:append('*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx')
vim.cmd('syntax on')

-- Color scheme
vim.g.onedark_config = { style = 'darker' }
vim.cmd('colorscheme onedark')

-- Filetype detection
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

-- Auto command for HTML filetype
vim.cmd [[
    autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
]]

-- Treesitter Configuration
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            return ok and stats and stats.size > max_filesize
        end,
    },
}

-- Keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local leader = " "

-- Set leader key
vim.g.mapleader = leader

-- File explorer and terminal
map('n', leader .. 'e', ':Lex<CR>', opts)
map('n', leader .. 't', ':split term://$SHELL<CR>i', opts)

-- Code Runner
map('n', leader .. 'rr', ':!echo "Output:" && python3 %<CR>', opts)

-- Telescope functionality
map('n', leader .. 'ff', ':Telescope find_files<CR>', opts)
map('n', leader .. 'fh', ':Telescope find_files hidden=true<CR>', opts)
map('n', leader .. 'fb', ':Telescope buffers<CR>', opts)
map('n', leader .. 'fo', ':Telescope oldfiles<CR>', opts)
map('n', leader .. 'fw', ':Telescope current_buffer_fuzzy_find<CR>', opts)
map('n', leader .. 'fr', ':Telescope registers<CR>', opts)
map('n', leader .. 'fm', ':Telescope marks<CR>', opts)
map('n', leader .. 'fg', ':Telescope git_status<CR>', opts)
map('n', leader .. 'fk', ':Telescope keymaps<CR>', opts)

-- Harpoon functionality
map('n', leader .. 'hj', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
map('n', leader .. 'ha', ':lua require("harpoon.mark").add_file()<CR>', opts)
map('n', leader .. 'hn', ':lua require("harpoon.ui").nav_next()<CR>', opts)
map('n', leader .. 'hy', ':lua require("harpoon.ui").nav_prev()<CR>', opts)
map('n', leader .. 'h1', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
map('n', leader .. 'h2', ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
map('n', leader .. 'h3', ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
map('n', leader .. 'h4', ':lua require("harpoon.ui").nav_file(4)<CR>', opts)

-- Git integration
map('n', leader .. 'ga', ':w<CR>:G add .<CR>', opts)
map('n', leader .. 'gc', ':G commit<CR>', opts)
map('n', leader .. 'gp', ':G push<CR>', opts)
map('n', leader .. 'gs', ':G<CR>', opts)
map('n', leader .. 'gl', ':G log<CR>', opts)

-- Function to toggle Hebrew
function ToggleHebrew()
    if vim.opt.rtl:get() then
        vim.opt.rtl = false
        vim.opt.spell = true
        print("Hebrew mode OFF")
    else
        vim.opt.rtl = true
        vim.opt.spell = false
        print("Hebrew mode ON")
    end
end

-- Toggle Hebrew keybindings
map('n', leader .. 'ht', ':lua ToggleHebrew()<CR>', opts)

-- Hex file functions
function DoHex()
    local current_file = vim.fn.expand('%')
    local new_file = current_file .. '.hex'
    vim.cmd('w !xxd > ' .. new_file)
    print("Hex file created and saved as " .. new_file)
end

function UndoHex()
    local current_file = vim.fn.expand('%')
    local new_file_stage1 = string.gsub(current_file, '%.hex$', '')
    local file_name = string.match(new_file_stage1, '(.*)%.(%w+)$')
    local file_extension = string.match(new_file_stage1, '%.(%w+)$')
    local new_file = file_name .. 'M.' .. file_extension
    vim.cmd('w !xxd -r > ' .. new_file)
    print("Reversed Hex file created and saved as " .. new_file)
end

function HexState()
    local operation = vim.fn.input("Choose operation (0 for DoHex, 1 for UndoHex): ")
    if operation == '0' then
        DoHex()
    elseif operation == '1' then
        UndoHex()
    else
        print("Invalid choice. Aborting.")
    end
end

-- Hex toggle keybinding
map('n', leader .. 'hx', ':lua HexState()<CR>', opts)

-- Spell-check toggle
map('n', '<C-z>', ':setlocal spell! spelllang=en_us<CR>', opts)

-- Quick exit from insert mode
map('i', 'jj', '<Esc>', opts)

-- Source the vim config
map('n', leader .. 'sc', ':source $MYVIMRC<CR>', opts)

-- Format whole document
map('n', '<A-C-l>', 'ggVG=', opts)

-- Format a paragraph into lines
map('n', 'Q', 'gq<CR>', opts)

-- Select all text
map('n', leader .. 'a', 'ggVG', opts)

-- Resize split windows using arrow keys
map('n', '<A-Up>', '<C-w>+', opts)
map('n', '<A-Down>', '<C-w>-', opts)
map('n', '<A-Left>', '<C-w><', opts)
map('n', '<A-Right>', '<C-w>>', opts)

-- Move between tabs
map('n', leader .. 't', 'gt', opts)

-- Opening/Creating a file in a new tab
map('n', leader .. 'c', ':tabedit<space>', opts)

-- Saving all files
map('n', '<C-S>', ':wa<CR>', opts)

-- Quitting and saving all files
map('n', '<C-q>', ':wqa<CR>', opts)

-- Surround word with a character
map('n', leader .. 'sw', ':echo "Press a character: " | let c = nr2char(getchar()) | exec "normal viwo\\ei" . c . "\\eea" . c . "\\e" | redraw<CR>', opts)

-- Replace all occurrences of a word
map('n', leader .. 'rw', ':%s//g<Left><Left>', opts)

-- Additional configurations can be added here as needed.

