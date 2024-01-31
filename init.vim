"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"
"			███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
"			████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
"			██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
"			██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
"			██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
"			╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               

"------------------PLUGINS------------------


	call plug#begin()

		Plug 'https://github.com/vim-airline/vim-airline' " Status bar
		Plug 'vim-airline/vim-airline-themes' " Color scheme for Status bar
		Plug 'navarasu/onedark.nvim' " Color scheme - onedark
		Plug 'tpope/vim-fugitive' " Git integration
		Plug 'https://github.com/nvim-lua/plenary.nvim' " Dependency for telescope
		Plug 'nvim-tree/nvim-web-devicons' " Devicons for telescope
		Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' } " Telescope - fuzzy search throw files
		Plug 'ThePrimeagen/harpoon' " Harpoon - better local marks
		Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter - better syntax highlighting
		Plug 'neoclide/coc.nvim', {'branch': 'release'} " For auto complete 


	call plug#end()

"	to do:
"
"		plug:
"			:PlugClean
"			:PlugInstall
"
"		nvim.coc:
"			python3->	:CocInstall coc-pyright
"			cpp->	:CocInstall coc-clangd
"			javascript-> :CocInstall coc-tsserver
"			html-> :CocInstall coc-html
"			css-> :CocInstall coc-css
"			rust->	:CocInstall coc-rust-analyzer
"			latex->	:CocInstall coc-texlab
"			python->	:CocInstall coc-python
"
"			add in CocConfig(inside {}):
"				"diagnostic.checkCurrentLine":true





"------------------SETTINGS------------------


" Disable compatibility with vi which can cause unexpected issues.
	set nocompatible

" Disable the vim bell
	set visualbell

" Disable auto commenting in a new line
	autocmd Filetype * setlocal formatoptions-=c formatoptions-=r  formatoptions-=o

" Setting the character encoding of Vim to UTF-8
	set encoding=UTF-8

" Enable type file detection. Vim will be able to try to detect the type of file is use.
	filetype on

" Enable spell check
	set spell

" Smart tab
	set smarttab

" Search down to subfolders
	set path+=**

" Enable plugins and load plugin for the detected file type.
	filetype plugin on

" Load an indent file for the detected file type.
	filetype indent on

" Turn syntax highlighting on.
	syntax on

" Add numbers to the file.
	set number relativenumber

" Mouse functionality
	set mouse=a

" Color scheme
	" With no plugins
	" color slate 
	" With plugins
	let g:onedark_config = {'style': 'darker',}	" Options: darker, dark, cool, deep, warm, warmer, light
	colorscheme onedark
	" Make Color of comments more visible (With no treesitter)
	highlight Comment guifg=#777777


" Highlight cursor line underneath the cursor horizontally.
	set cursorline

" Highlight cursor line underneath the cursor vertically.
	set cursorcolumn

" Set shift width to 4 spaces.Set tab width to 4 columns.
	set shiftwidth=4
	set tabstop=4

" If the current file type is HTML, set indentation to 2 spaces.
	autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" Do not save backup files.
	set nobackup

" Do wrap lines.
	set wrap

" While searching though a file incrementally highlight matching characters as you type.
	set incsearch
	set hlsearch

" Ignore capital letters during search.
	set ignorecase

" Show partial command you type in the last line of the screen.
	set showcmd

" Show the mode you are on the last line.
	set showmode

" Show matching words during a search.
	set showmatch

" Set the commands to save in history default number is 20.
	set history=1000

" Setting the split window to open as i like (like in a WM - qtile)
	set splitbelow splitright

" Enable auto completion menu after pressing TAB.
	set wildmenu

" There are certain files that we would never want to edit with Vim.
" Wild menu will ignore files with these extensions.
	set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Closing compaction in insert mode
	inoremap ( ()<left>
	inoremap { {}<left>
	inoremap [ []<left>
	inoremap /* /**/<left><left>

" Status line - Airline
	" Better looking
	let g:airline_powerline_fonts = 1
	" Color scheme
	let g:airline_theme='onedark'

" File Browsing settings
	let g:netrw_banner=1 " Seeing the banner
	let g:netrw_liststyle=3
	let g:netrw_showhide=1
	let g:netrw_winsize=20


" Treesitter settings
lua << EOF
	require'nvim-treesitter.configs'.setup {
	  -- A list of parser names, or "all"
	  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" }, -- Mast have
	  sync_install = false, -- Install parsers synchronously
	  auto_install = true, -- Automatically install missing parsers when entering buffer
	  ignore_install = { "" }, -- List of parsers to ignore installing (or "all")

	  highlight = {
	    enable = true,
	    disable = {""}, -- list of language that will be disabled. For disable highlighting for the `tex` filetype, include `latex` in the list
		-- Disable slow treesitter highlight for large files
	    disable = function(lang, buf) 
	        local max_filesize = 100 * 1024 -- 100 KB
	        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
	        if ok and stats and stats.size > max_filesize then
	            return true
	        end
	    end,
	    additional_vim_regex_highlighting = false, -- May slow down your editor, and some duplicate highlights.
	  },
	}
EOF
" Make Color of comments more visible (With treesitter)
	hi @comment guifg=#777777

"------------------GUI_VERSION------------------

" If the user want more compatible editor
if exists('g:GuiLoaded')
	echo "GUI NVIM"
	" Make Airline more font compatible 
	let g:airline_powerline_fonts = 0
	" Start Lex Tree and put the cursor back in the other window.
	    " Start Lex Tree and put the cursor back in the other window.
    autocmd VimEnter * Lex | wincmd p
endif

"------------------Hex_Toggle_Functions------------------

function! DoHex()
    " Get the current buffer name
    let current_file = expand('%')

    " New file name
	let new_file = current_file . '.hex'

    " Save the current buffer as a hex file
    execute 'w !xxd > ' . new_file

    echo "Hex file created and saved as " . new_file
endfunction

function! UndoHex()
    " Get the current buffer name
    let current_file = expand('%')

	" Name stage 1: Remove the .hex extension if it exists
    let new_file_stage1 = substitute(current_file, '\.hex$', '', '')

	" Get the file name without extension
	let file_name = substitute(new_file_stage1, '\(.*\)\.\(\w\+\)$', '\1', '')

	" Get the file extension
	let file_extension = substitute(new_file_stage1, '\(.*\)\.\(\w\+\)$', '\2', '')

	" Add 'M' before the extension(M = Modded)
	let new_file = file_name . 'M.' . file_extension

    " Save the current buffer as a reversed hex file
    execute 'w !xxd -r > ' . new_file

    echo "Reversed Hex file created and saved as " . new_file
endfunction

" Function to toggle between hex and original states
function! HexState()
    " Get user input to choose the operation (0 for DoHex, 1 for UndoHex)
    let operation = input("Choose operation (0 for DoHex, 1 for UndoHex): ")

    if operation == 0
        " Execute the DoHex function
        call DoHex()
    elseif operation == 1
        " Execute the UndoHex function
        call UndoHex()
    else
        echo "Invalid choice. Aborting."
    endif
endfunction

"------------------Hebrew_Toggle_Function------------------

function! ToggleHebrew()
	if &rl
		set norl
		set keymap=
		set spell
		echom "Hebrew mode OFF"
	else
		set rl
		set keymap=hebrew
		set nospell
		echom "Hebrew mod ON"
	endif
endfunction


"------------------KEY_BINDINGS------------------

" Set the space  as the leader key.
	let mapleader = " "


" ---Code_runner--- ( Leader + rr)
	" Markdown
	autocmd Filetype markdown nnoremap <leader>rr <cmd>!echo \n\n\n"Compiling to pdf..."\n && pandoc -f markdown-implicit_figures --highlight-style=tango -t pdf % -o %:r.pdf && zathura %:r.pdf &<CR>
	" Python
	autocmd FileType python nnoremap <leader>rr <cmd>!echo \n\n\n"Output:"\n && python3 %<CR>
	" JavaScript with Node.js
	autocmd FileType javascript nnoremap <leader>rr <cmd>!echo \n\n\n"Output:"\n && node %<CR>
	" HTML in default browser
	autocmd FileType html nnoremap <leader>rr <cmd>!echo \n\n\n"Opening:"\n && open % &<CR>
	" C
	autocmd FileType c nnoremap <leader>rr <cmd>!echo \n\n\n"Compiling:"\n && gcc % -o %:r && echo \n\n\n"Success"\n"The Output:"\n\n && %:p:r<CR>
	" C++
	autocmd FileType cpp nnoremap <leader>rr <cmd>!echo \n\n\n"Compiling:"\n && g++ % -o %:r -pthread -std=c++17 && echo \n\n\n"Success"\n"The Output:"\n\n && %:p:r<CR>
	" Rust
	autocmd FileType rust nnoremap <leader>rr <cmd>!echo \n\n\n"Compiling:"\n && cargo run<CR>
	" LaTeX
	autocmd FileType tex nnoremap <leader>rr <cmd>!echo \n\n\n"Compiling:"\n && xelatex %<CR>



" Spell-check on\off
	map <C-z> <cmd>setlocal spell! spelllang=en_us<CR>


" Type jj to exit insert mode quickly.
	inoremap jj <Esc>


" Source the vim config
	nnoremap <leader>sc <cmd>source $MYVIMRC<CR>


" Format a paragraph into lines
	map Q gq<CR>


" Select all the text
	nnoremap <leader>a ggVG

" Opening a file explore - stay as only window unlike NERD tree
	map <leader>e <cmd>Lex<CR>


" Opening a terminal window at a split at the bottom
	map <C-t> <cmd>split term://$SHELL<CR>i
" Closing the terminal window
	tnoremap <C-t> exit<CR>
" CTRL+I or Esc to make the terminal scrollable and I to input mode
	tnoremap <c-i> <C-\><C-n> 
	tnoremap <Esc> <C-\><C-n>


" You can split the window in Vim. y - in the y access , x - in the x access
	map <leader>y :split<space>
	map <leader>x :vsplit<space>


" Navigate the splits view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
	tnoremap <C-h> <C-\><C-N><C-w>h
	tnoremap <C-j> <C-\><C-N><C-w>j
	tnoremap <C-k> <C-\><C-N><C-w>k
	tnoremap <C-l> <C-\><C-N><C-w>l

	inoremap <C-h> <C-\><C-N><C-w>h
	inoremap <C-j> <C-\><C-N><C-w>j
	inoremap <C-k> <C-\><C-N><C-w>k
	inoremap <C-l> <C-\><C-N><C-w>l

	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l


" Resize split windows using arrow keys by pressing:
" Alt+UP, Alt+DOWN, Alt+LEFT, or Alt+RIGHT.
	noremap <A-Up> <C-w>+
	noremap <A-Down> <C-w>-
	noremap <A-Left> <C-w>>
	noremap <A-Right> <C-w><


" Moving between tabs
	map <leader>t gt


" Opening\Creating a file in a new tab - write the tab to open
	nnoremap <leader>c :tabedit<space>


" Saving all file using CTRL+S
	map <C-S> :wa<CR>


" Quitting and saving a file using CTRL+S
	map <C-q> :wqa<CR>


" Surround word with a wanted character
	nnoremap <leader>sw <cmd>echo "Press a character: " \| let c = nr2char(getchar()) \| exec "normal viwo\ei" . c . "\eea" . c . "\e" \| redraw<CR>


" Replace all occurrences of a word
	nnoremap <leader>rw :%s/\<<c-r><c-w>\>//g<left><left>


" Toggle Hebrew key maps and Right-to-Left setting
	nnoremap <leader>ht <cmd>call ToggleHebrew()<CR>


" Toggle between creating a Hex conversion file and reversing the conversion
	nnoremap <leader>hx <cmd>call HexState()<CR>


" Map V-Block to not confuse with Past
	noremap <leader>v <C-v>


" Opening a file from file explore
	map <leader>o :Explore<CR>


" Git integration
	" Git stage all changes
	nnoremap <leader>ga <cmd>w<CR> <cmd>G add .<CR>
	" Git commit
	nnoremap <leader>gc <cmd>G commit<CR>
	" Git push current branch
	nnoremap <leader>gp <cmd>G push<CR>
	" Git status
	"	Keys:
	"		- -> stage and ustage a file
	"		cc -> commit massage
	nnoremap <leader>gs <cmd>G<CR>
	" Git log
	nnoremap <leader>gl <cmd>G log<CR>
	" Git marge conflict: 
	"	:Gvdiffsplit!
	"		to chose what window we want to take: dXo - (X - left-> d2o , right-> d3o)


" Telescope functionality
	" Finding a file in the working directly and opening it
	nnoremap <leader>ff <cmd>Telescope find_files<CR>
	" Finding all the files in the working directly include the middens and opening it
	nnoremap <leader>fh <cmd>Telescope find_files hidden=true<CR>
	" Finding an open file(buffers) and moving to it
	nnoremap <leader>fb <cmd>Telescope buffers<CR>
	" Resent opened files(old files)
	nnoremap <leader>fo <cmd>Telescope oldfiles<CR>
	" Fuzzy word finding
	nnoremap <leader>fw <cmd>Telescope current_buffer_fuzzy_find<CR>
	" Pick from register
	nnoremap <leader>fr <cmd>Telescope registers<CR>
	" Select and go to mark
	nnoremap <leader>fm <cmd>Telescope marks<CR>
	" Git Status
	nnoremap <leader>fg <cmd>Telescope git_status<CR>
	" All the keybinding
	nnoremap <leader>fk <cmd>Telescope keymaps<CR>

" Harpoon functionality
	" Toggling harpoon (the j is for speed)
	nnoremap <leader>hj <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
	" Adding to harpoon
	nnoremap <leader>ha <cmd>lua require("harpoon.mark").add_file()<CR>
	" Next file in harpoon
	nnoremap <leader>hn <cmd>lua require("harpoon.ui").nav_next()<CR>
	" Previous file in harpoon (the y for speed)
	nnoremap <leader>hy <cmd>lua require("harpoon.ui").nav_prev()<CR>
	" The first 4 files
	nnoremap <leader>h1 <cmd>lua require("harpoon.ui").nav_file(1)<CR>
	nnoremap <leader>h2 <cmd>lua require("harpoon.ui").nav_file(2)<CR>
	nnoremap <leader>h3 <cmd>lua require("harpoon.ui").nav_file(3)<CR>
	nnoremap <leader>h4 <cmd>lua require("harpoon.ui").nav_file(4)<CR>

" Coc functionality
	"Tab and Enter completion
	" Up key: Cycles through completion 
		inoremap <silent><expr> <Up> coc#pum#visible() ? coc#pum#prev(1) : "\<Up>"
	
	" Down key: Cycles through completion items in reverse order
		inoremap <silent><expr> <Down> coc#pum#visible() ? coc#pum#next(1) : "\<Down>"
	
	" Tab & Enter key: Accepts the selected completion
		inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
		inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<Tab>"
	
	" Jump to definition (X and Y for the axis, T for tab)
		nnoremap <leader>dx <cmd>call CocAction('jumpDefinition', 'vsplit')<CR>
		nnoremap <leader>dy <cmd>call CocAction('jumpDefinition', 'split')<CR>
		nnoremap <leader>dt <cmd>call CocAction('jumpDefinition', 'tabe')<CR>
	" Organizing imports
		nnoremap <leader>ci <cmd>call CocAction('organizeImport')<CR>
	" Quick fix
		nnoremap <leader>cf <cmd>call CocAction('doQuickfix')<CR>


" For copy and past
	map <C-S-V> "+P
	vnoremap <C-C> "*y :let @+=@*<CR>
" If not in Linux replace the keybinding in above line with: vnoremap <C-C> "+y


" Moving lines in visual mode
	vnoremap J :m '>+1<CR>gv=gv
	vnoremap K :m '>-2<CR>gv=gv


"------------------END_KEY------------------

