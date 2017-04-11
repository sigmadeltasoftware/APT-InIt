
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-haml'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'

" All of your Plugins must be added before the following line
call vundle#end()

"======= END VUNDLE CONFIG =========

syntax on
filetype plugin indent on

" delimitMate
so ~/.vim/bundle/delimitMate/test/_setup.vim
let delimitMate_expand_cr = 1

" Enable JavaScript syntax highlighting 
let javascript_enable_domhtmlcss=1

" YouCompleteMe C++ Support
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_register_as_syntastic_checker = 0
autocmd CompleteDone * pclose


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Extra CPP Enhanced highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" Toggle NERDTree using CTRL+n
map <C-n> :NERDTreeToggle<CR>

" Smarter tab line - Vim-Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_buffers = 0
set laststatus=2


" Javacsript-library-syntax
let g:used_javascript_libs = 'jasmine'

" Enable copying to clipboard using 'CTRL + c'
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Colorscheme
colorscheme molokai

" Start with fullscreen
:set lines=999 columns=999


" Needed fr Syntax highlighting
syntax enable


" Switch between split screens easily
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

" Who wants an 8 character tab?  Not me!
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

" Line Numbers PWN!
set number

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" When I close a tab, remove the buffer
set nohidden

" TODO Mode
nnoremap <silent> <Leader>todo :execute TodoListMode()<CR>

" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>

" New Tab
nnoremap <silent> <C-t> :tabnew<CR>


" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Enable indenting by Shift-Space & Ctrl-Space due to tab being used by other
" plugins
vmap <S-Space> >gv
vmap <C-Space> <gv

" Navigate using ALT + WASD
nnoremap å h
nnoremap ß j
nnoremap ∑ k
nnoremap ∂ l

imap å <Left>
imap ß <Down>
imap ∑ <Up>
imap ∂ <Right>

