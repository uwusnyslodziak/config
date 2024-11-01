set tabstop=4
set shiftwidth=4
set expandtab
set number relativenumber
set smartindent
set nolist wrap linebreak breakat&vim
set splitright

call plug#begin()

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'elkowar/yuck.vim'
Plug 'kaarmu/typst.vim'
Plug 'terrortylor/nvim-comment'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'Mofiqul/adwaita.nvim'
Plug 'junegunn/limelight.vim'
Plug 'gelguy/wilder.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'm4xshen/autoclose.nvim'
Plug 'nvim-treesitter/nvim-treesitter' 
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'chomosuke/typst-preview.nvim'

call plug#end()

function! Termpy()
    exec winwidth(0)/3."vsplit" | terminal python3 %
endfunction
autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif

autocmd BufEnter *.md set nobuflisted | :Goyo

nnoremap <C-R> :call Termpy() <CR>
nnoremap <C-C> :bdelete <CR>
nnoremap <C-U> :redo <CR>

set termguicolors
let g:adwaita_darker = v:true " for darker version
let g:adwaita_disable_cursorline = v:false " to disable cursorline
let g:adwaita_transparent = v:true " makes the background transparent
colorscheme catppuccin

lua require('nvim_comment').setup()
lua require('colorizer').setup()

lua require("autoclose").setup()

call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })

" Move to previous/next
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
" Restore buffer
nnoremap <silent>    <A-s-c> <Cmd>BufferRestore<CR>

nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
nnoremap <silent> <C-p>    <Cmd>BufferPickDelete<CR>

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave qa
