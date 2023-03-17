
set title

if exists(":GuiFont")
	GuiFont IosevkaTerm NF:h16
endif

if exists(":GuiWindowOpacity")
	GuiWindowOpacity 0.7
endif

if exists(":GuiLinespace")
	GuiLinespace 2
endif

let mapleader = " "
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap J mzJ`z

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap n nzzzv
nnoremap N nzzzv

xnoremap <leader>p "_dP

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

