execute pathogen#infect()

se t_Co=256

"emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall

"airline plugin
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'
set laststatus=2

autocmd BufNewFile,BufReadPost *.cpp,*.hpp let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ '
autocmd BufNewFile,BufReadPost *.c,*.h let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ '


if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

"let g:solarized_visibility = "low"
colorscheme solarized
set background=dark

set mouse=a			"Obsługa myszki"
set wildmenu		"rozwinięte podpowiedzi w commandmodzie"
set wildignore=*.o,*.obj,*.bak,*.exe "podowiedzi omijają takie regexy."
set showcmd			"pokazuje komendy wydane w dolnym pasku"
set showmode		"Pokazuj tryb w lewym dolnym rogu"
set nowrap			"nie zawijaj wierszy wychodzących za ekran"
set showmatch		"dopasowuj nawiasy"
set ruler			"numer kolumny, wiersza, procent tekstu w prawym dolnym rogu"
set guioptions-=T

set incsearch 		"szukaj w trakcie pisania
set hlsearch		"podświetlaj wyszukane wyniki
set ignorecase		"ignoruj wielkość liter"
set smartcase		"no chyba że wpiszesz dużą"

set tabstop=4		"konwersja taba na spacje"
set shiftwidth=4

set foldmethod=syntax
set number			"wyświetlaj numery wierszy"
set relativenumber	"relatywnie do pozycji kursora"

" setlocal spell spelllang=pl	"sprawdzanie pisowni guzikami ]s [s. zg - słowo dobre, zb -słowo złe. z= dopasuj dobre słowo"

syntax enable						"podświetlanie składni"
filetype plugin indent on 			"wcięcia"
:filetype indent on

" Autoformat cpp
" TODO
let g:formatprg_args_expr_cpp = '"--mode=cs --style=ansi --indent-namespaces -pcH".(&expandtab ? "s".&shiftwidth : "t")'
let g:formatprg_cpp = "astyle"
let g:formatprg_args_cpp = "--style=linux --indent=tab=8 -xcCKxwfxdp"
let g:formatprg_java = "astyle"
let g:formatprg_args_java = "--style=java --indent=tab=8"
map <C-f> :Autoformat<CR>

" vimdiff tylko prawolewy
set diffopt=vertical,filler

" Omnicompletion settings
set omnifunc=syntaxcomplete#Complete

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

" Przysługa dla samego siebie - produktywność +10%
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" fugitive git bindings
" nnoremap <space>gc :Gcommit -v -q<CR>
" nnoremap <space>gt :Gcommit -v -q %:p<CR>
" nnoremap <space>ge :Gedit<CR>
" nnoremap <space>gr :Gread<CR>
" nnoremap <space>gw :Gwrite<CR><CR>
" nnoremap <space>gp :Ggrep<Space>
" nnoremap <space>gm :Gmove<Space>
" nnoremap <space>gb :Git branch<Space>
" nnoremap <space>go :Git checkout<Space>
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gps :!git push origin master<CR>
nnoremap <space>gpl :!git pull origin master<CR>
nnoremap <space>gl :!tig<CR>

" Wygeneruj tagi dla projektu
map <F11> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q <CR><CR>

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" wykomentowane bo lagi
"set completeopt=menuone,menu,longest,preview
" make Enter select an entry when the popup menu is visible
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" CtrlP plugin
" Setup some default ignores
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
			\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
			\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" SQL Settings
if expand('%:t') =~ ".*\.sqlout"
endif
if expand('%:t') =~ ".*\.sql"
endif

map cn <esc>:cn<cr>
map cp <esc>:cp<cr>
map co <esc>:copen<cr>

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

autocmd BufNewFile,BufReadPost *.cpp,*.hpp map <F6> :w<CR> :!clear; <CR>:make all<CR> :redraw!<CR>
autocmd BufNewFile,BufReadPost *.cpp,*.hpp map <F7> :!clear; <CR> :make run<CR> 
autocmd BufNewFile,BufReadPost *.sqlout set tabstop=30 set nowrap
autocmd BufNewFile,BufReadPost *.sql map <F6> :w<CR> :!mysql < % &> out.sqlout; ./parser.pl out.sqlout > out.refactored;<CR> :tabe out.refactored<CR>

"map <F2> :!rsync -auvr --exclude=".git" source target<CR>
map <F9> :GundoToggle<CR>
map <F10> :NERDTreeToggle<CR>
map <F12> :TagbarToggle<CR> 
