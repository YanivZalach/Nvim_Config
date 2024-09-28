---------------------------------------------------------------------------               
--
--			███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
--			████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
--			██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
--			██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
--			██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
--			╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
---------------------------------------------------------------------------   


------------------ Installing the plugin manager automatically ------------------
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

------------------ Installing the plugins ------------------
require('lazy').setup({
	'navarasu/onedark.nvim', -- Color scheme - onedark
	'tpope/vim-fugitive', -- Git integration
	'ThePrimeagen/harpoon', -- Harpoon - better local marks
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}, -- Treesitter - better syntax highlighting
	{
		'vim-airline/vim-airline', -- Status bar
		'vim-airline/vim-airline-themes' -- Color scheme for Status bar
	},
	{
		{'nvim-telescope/telescope.nvim', tag = '0.1.2'}, -- Telescope - fuzzy search
		'nvim-lua/plenary.nvim', -- Dependency for telescope
		'nvim-tree/nvim-web-devicons' -- Devicons for telescope
	},
	{
		'neovim/nvim-lspconfig', -- LSP
		'williamboman/mason.nvim', -- Plugin manager
		'williamboman/mason-lspconfig.nvim', -- Bridge from LSP to Mason
		'hrsh7th/nvim-cmp' , -- Auto completion
		'hrsh7th/cmp-nvim-lsp' ,
		'hrsh7th/cmp-buffer' ,
		'hrsh7th/cmp-path' ,
		'hrsh7th/cmp-cmdline' ,
		'hrsh7th/cmp-nvim-lua'
	}
})

------------------ Settings ------------------
vim.opt.compatible = false
vim.opt.visualbell = true
vim.opt.encoding = 'utf-8'
vim.opt.spell = true
vim.opt.smarttab = true
vim.opt.path:append('**')
vim.cmd('syntax on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')
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
vim.g.netrw_banner = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_showhide = 1
vim.g.netrw_winsize = 20


-- Wild menu will ignore files with these extensions
vim.opt.wildignore:append('*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx')

-- Auto for HTML filetype
vim.cmd [[
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
]]

-- Disable auto commenting in a new line
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
	end,
})

------------------ Color scheme ------------------
vim.g.onedark_config = { style = 'darker' }
vim.cmd('colorscheme onedark')
vim.cmd('highlight Comment guifg=#777777')
vim.cmd('hi @comment guifg=#777777')


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

------------------ Keybindings ------------------
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local opts_noise = { noremap = true, silent = false }
local leader = " "

-- Set leader key
vim.g.mapleader = leader

-- Fix copy/paste and visual-block
map('n', '<C-S-V>', '"+P', opts)
map('v', '<C-C>', '"*y :let @+=@*<CR>', opts)
map('n', leader .. 'v', '<C-v>', opts)

-- Close bracts
map('i', '(','()',opts)
map('i', '"','""',opts)
map('i', '{', '{}',opts)
map('i', '[', '[]',opts)
map('i', '/*','/**/',opts)

-- File explorer and terminal
map('n', leader .. 'e', ':Lex<CR>', opts)
map('n', leader .. 'o', ':Explore<CR>', opts)
map('n', leader .. 'tt', ':bot term<CR>', opts)
map('t','<Esc>', '<C-\\><C-n>', opts)
map('t','jj', '<C-\\><C-n>', opts)

-- Spell-check toggle
map('n', '<C-z>', ':setlocal spell! spelllang=en_us<CR>', opts)

-- Quick exit from insert mode
map('i', 'jj', '<Esc>', opts)

-- Format whole document
map('n', '<A-C-l>', 'mzggVG=`zzz', opts)

-- Format a paragraph into lines
map('n', 'Q', 'gq<CR>', opts)

-- Select all text
map('n', leader .. 'a', 'ggVG', opts)


-- Markdown: Compile to PDF
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rr', 
		'<cmd>!echo "\\n\\n\\nCompiling to pdf...\\n" && pandoc -f markdown-implicit_figures --highlight-style=tango -t pdf % -o %:r.pdf && zathura %:r.pdf &<CR>',
		{ noremap = true, silent = true }
		)
	end
})

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
	if vim.opt.rl:get() then
		vim.opt.rl = false
		vim.opt.spell = true
		vim.cmd('set keymap=')
		print("Hebrew mode OFF")
	else
		vim.opt.rl = true
		vim.opt.spell = false
		vim.cmd('set keymap=hebrew')
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

-- Split to window
map('n', leader .. 'x',':split<space>', opts_noise)
map('n', leader .. 'y',':vsplit<space>', opts_noise)

-- Move between windows
map('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)
map('t', '<C-j>', '<C-\\><C-n><C-w>j', opts)
map('t', '<C-k>', '<C-\\><C-n><C-w>k', opts)
map('t', '<C-l>', '<C-\\><C-n><C-w>l', opts)

map('i', '<C-h>', '<C-\\><C-n><C-w>h', opts)
map('i', '<C-j>', '<C-\\><C-n><C-w>j', opts)
map('i', '<C-k>', '<C-\\><C-n><C-w>k', opts)
map('i', '<C-l>', '<C-\\><C-n><C-w>l', opts)

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)


-- Resize split windows using arrow keys
map('n', '<A-Up>', '<C-w>+', opts)
map('n', '<A-Down>', '<C-w>-', opts)
map('n', '<A-Left>', '<C-w><', opts)
map('n', '<A-Right>', '<C-w>>', opts)

-- Opening/Creating a file in a new tab
map('n', leader .. 'c', ':tabedit<space>', opts_noise)

-- Move between tabs
map('n', '<S-Tab>', 'gt', opts)

-- Saving all files
map('n', '<C-S>', ':wa<CR>', opts)

-- Quitting and saving all files
map('n', '<C-q>', ':wqa<CR>', opts)

-- Surround word with a character
map('n', leader .. 'sw', ':echo "Press a character: " | let c = nr2char(getchar()) | exec "normal viwo\\ei" . c . "\\eea" . c . "\\e" | redraw<CR>', opts)

-- Replace all occurrences of a word
function ReplaceWord()
	local word = vim.fn.expand("<cword>")  
	if word ~= "" then
		local new_word = vim.fn.input("Replace '" .. word .. "' with: ")
		if new_word ~= "" then
			-- Perform the replacement
			vim.cmd(":%s/\\<" .. word .. "\\>/" .. new_word .. "/g")
		else
			print("\nAborting. No new word given.")
		end
	else
		print("Aborting. No word under cursor.")
	end
end

map('n', leader .. 'rw', ':lua ReplaceWord()<CR>', opts)

-- Plugin manager status
map('n', leader .. 'ps', ':Lazy<CR>' ,opts)
map('n', leader .. 'pi', ':Mason<CR>' ,opts)

------------------ LSP ------------------
local lsp_servers = {
	"lua_ls",  -- Lua Language Server
	"pyright",  -- Python Language Server
	"rust_analyzer",  -- Rust Language Server
	"gopls",    -- Go Language Server
	"jdtls",    -- Java Development Tools Language Server
	"clangd",   -- C/C++ Language Server
	"ts_ls",    -- TypeScript/JavaScript Language Server
	"html",     -- HTML Language Server
	"cssls",    -- CSS Language Server
}


require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = lsp_servers
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
	mapping = {
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'cmdline' },
		{ name = 'nvim_lua' },
	},
})

-- LSP on_attach function
local on_attach = function(_, bufnr)
	local attach_opts = { buffer = bufnr }

	vim.keymap.set('n', '<C-b>', vim.lsp.buf.definition, attach_opts)
	vim.keymap.set('n', '<S-F6>', vim.lsp.buf.rename, attach_opts)
	vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, attach_opts)
	vim.keymap.set('n', '<leader>gd', vim.lsp.buf.declaration, attach_opts)
	vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, attach_opts)
	vim.keymap.set('n', '<leader>go', vim.lsp.buf.type_definition, attach_opts)
	vim.keymap.set('n', '<leader>gs', vim.lsp.buf.signature_help, attach_opts)
	vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, attach_opts)
end

local function setup_lsp(server)
	require("lspconfig")[server].setup {
		on_attach = on_attach,
		capabilities = require('cmp_nvim_lsp').default_capabilities(),
	}
end

for _, server in ipairs(lsp_servers) do
	setup_lsp(server)
end
