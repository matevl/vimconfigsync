" ~/.vimrc

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" https://github.com/tpope/vim-sensible
Plugin 'tpope/vim-sensible'

" NERDTree - File system explorer
Plugin 'preservim/nerdtree'

" GitGutter - Shows git diff in the gutter
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

runtime! plugin/sensible.vim

set encoding=utf-8 fileencodings=
syntax on

" INDENT AND TABS

set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=4
set number
set cc=80

autocmd Filetype make setlocal noexpandtab

set list listchars=tab:»·,trail:·


" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif

" PLUGIN CONFIGURATION

" NERDTree: Start automatically when opening a directory
autocmd VimEnter *
            \ if argc() == 1
            \   && isdirectory(argv()[0])
            \ | execute 'NERDTree' argv()[0]
            \ | wincmd p
            \ | enew
            \ | execute 'cd '.argv()[0]
            \ | endif

" Toggle NERDTree with Ctrl + n
nnoremap <C-n> :NERDTreeToggle<CR>

" GitGutter: No additional configuration needed for basic usage
