
"Вырубаем режим совместимости с VI:
set nocompatible
filetype off    " required"

call plug#begin('~/.vim/plugged')

"Plags

"---------=== Code/project navigation ===-------------

Plug 'majutsushi/tagbar'	" Class/module browser
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} " Project and file navigation

"------------------=== Other ===----------------------

Plug 'vim-airline/vim-airline'		" Lean & mean status/tabline for vim
Plug 'fisadev/FixedTaskList.vim'		" Pending tasks list
Plug 'rosenfeld/conque-term'			" Consoles as buffers
Plug 'tpope/vim-surround'		" Parentheses, brackets, quotes, XML tags, and more
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors' " multiple selections
Plug 'severin-lemaignan/vim-minimap' " A code minimap for Vim
Plug 'christoomey/vim-tmux-navigator' " TMux - Vim integration

"--------------=== Snippets support ===---------------
Plug 'garbas/vim-snipmate'		" Snippets manager
Plug 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plug 'tomtom/tlib_vim'		" dependencies #2
Plug 'honza/vim-snippets'		" snippets repo
"---------------=== Languages support ===-------------
" --- Python ---
Plug 'klen/python-mode'	        " Python mode (docs, refactor, lints,
"  highlighting, run and ipdb and more)
Plug 'davidhalter/jedi-vim'		" Jedi-vim autocomplete plugin
Plug 'mitsuhiko/vim-jinja'		" Jinja support for vim
Plug 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

"---------------===    Colorschemes   ===-------------

Plug 'morhetz/gruvbox'

"---------------=== Control sessions  ===-------------

Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"---------------=== Moving code     ===-------------

Plug 'matze/vim-move'

"---------------=== Comminting code ===-------------

Plug 'tomtom/tcomment_vim'

"---------------=== Show difference ===-------------

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()


filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
"" General settings
"=====================================================
colorscheme gruvbox
set background=dark 
syntax on
set number
set cursorline
set cursorcolumn

" настройка на Tab
set tabstop=4
set shiftwidth=4
set smarttab

" Демонстрация нажимаемых клавиш в нормальном режиме
:set showcmd

"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем
"  на темном фоне текст
augroup vimrc_autocmds
	autocmd!
	autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
	autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

" указываем каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" TagBar настройки
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии

" NerdTree настройки
" показать NERDTree на Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" "игноррируемые файлы с расширениями
let NERDTreeIgnore=['__pycache__', '\.pyc$', '\.o$', '\.swp',  '*\.swp', '\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  

" TaskList настройки
map <F2> :TaskList<CR> 	   " отобразить список тасков на F2

 
" Копи/паст по Ctrl+C/Ctrl+V
vmap <C-C> "+yi
imap <C-V> "+gPi

" Коприрование с буфер по умолчанию
set clipboard=unnamedplus

"Settings for sessions
let g:session_autosave = 'yes'
let g:session_default_to_last = 1
let g:session_autoloat = 'yes'

"Colorsheme for code map
let g:minimap_highlight='Visual'

"Settings for airline
let g:airline_theme = 'dark'
let g:airline_enable_fugitive = 1
let g:airline_enable_syntastic = 1
let g:airline_enable_bufferline = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  " let g:airline_left_sep = '»'
  " let g:airline_left_sep = '▶'
  " let g:airline_right_sep = '«'
  " let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  " let g:airline_symbols.linenr = '☰'
  " let g:airline_symbols.linenr = '␊'
  " let g:airline_symbols.linenr = '␤'
  " let g:airline_symbols.linenr = '¶'
  " let g:airline_symbols.maxlinenr = ''
  " let g:airline_symbols.maxlinenr = '㏑'
  " let g:airline_symbols.branch = '⎇'
  " let g:airline_symbols.paste = 'ρ'
  " let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
 " let g:airline_left_sep = ''
 " let g:airline_left_alt_sep = ''
 " let g:airline_right_sep = ''
 " let g:airline_right_alt_sep = ''
 " let g:airline_symbols.branch = ''
 " let g:airline_symbols.readonly = ''
 " let g:airline_symbols.linenr = '☰'
 " let g:airline_symbols.maxlinenr = ''

  " old vim-powerline symbols
  "let g:airline_left_sep = '⮀'
  "let g:airline_left_alt_sep = '⮁'
  "let g:airline_right_sep = '⮂'
  "let g:airline_right_alt_sep = '⮃'
  "let g:airline_symbols.branch = '⭠'
  "let g:airline_symbols.readonly = '⭤'
  "let g:airline_symbols.linenr = '⭡'

"=====================================================
"" Python-mode settings
"=====================================================
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_python = 'python3'
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pylint','pyflakes', 'pep8']
"let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1



" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>+'
"=====================================================
"" User hotkeys
"=====================================================
" ConqueTerm
" запуск интерпретатора на F5
nnoremap <F5> :ConqueTermSplit ipython<CR>
" а debug-mode на <F6>
nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR>
let g:ConqueTerm_Syntax = 'python'
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0
" проверка кода в соответствии с PEP8 через <leader>8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

" автокомплит через <Ctrl+Space>
inoremap <C-space> <C-x><C-o>"

" Changing key modifier for vim-move
let g:move_key_modifier = 'C'

" Settings mapping for multy cursour
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_word_key      = '<C-M>'
let g:multi_cursor_select_all_word_key = '<C-v>'
let g:multi_cursor_start_key           = 'g<C-M>'
let g:multi_cursor_select_all_key      = 'g<C-v>'
let g:multi_cursor_next_key            = '<C-M>'
let g:multi_cursor_prev_key            = '<C-B>'
let g:multi_cursor_skip_key            = '<C-X>'
let g:multi_cursor_quit_key            = '<Esc>'
