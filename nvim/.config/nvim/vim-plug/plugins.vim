" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall
"  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'honza/vim-snippets'
    Plug 'junegunn/fzf.vim'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'tpope/vim-surround'
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'joshdick/onedark.vim'
    Plug 'itchyny/lightline.vim'
"   Plug 'vim-airline/vim-airline'
"   Plug 'vim-airline/vim-airline-themes'   
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
