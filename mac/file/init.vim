"vim plug-----------------------------------------------
"
call plug#begin('~/.vim/plugged') " 플러그인 시작
"NERDTree
Plug 'preservim/nerdtree'

"JellyBeans
Plug 'nanotech/jellybeans.vim'

"Airline
Plug 'vim-airline/vim-airline'

"Tagbar
Plug 'preservim/tagbar'

"CtrlP 파일 탐색 플러그인
Plug 'ctrlpvim/ctrlp.vim'

"Syntastic
"linter plugin
"Plug 'scrooloose/Syntastic'

"COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}

"vim verilog instance
Plug 'antoinemadec/vim-verilog-instance'

"ale linter
Plug 'w0rp/ale' 

"vim indent guides
Plug 'nathanaelkane/vim-indent-guides'

"vim devicons
"NERDTree의 파일 확장자 아이콘
Plug 'ryanoasis/vim-devicons'

"vim diminactive 
Plug 'blueyed/vim-diminactive'

call plug#end()
"
"--------------------------------------------------------------

" 형식별 구문 강조 표시
syntax on 

" 라인 넘버 표시. (= nu)
set number 

" 사용자가 입력한 명령어 표시
set showcmd 

" 현재 선택된 괄호의 쌍을 표시
set showmatch 

" 커서를 기준으로 라인 넘버 표시. 커서 위치에 따라 바뀜. (= rnu)
"set relativenumber 

" 커서가 있는 라인을 강조 표시. (= cul)
set cursorline 

" 커서 위치 표시. (= ru)
set ruler 

" 상태바 표시. (= ls) [0: 상태바 미표시 / 1: 2개 이상의 윈도우에서 표시 / 2: 항상 표시]
set laststatus=2 

" 상태바 커스터마이징 %<item>으로 사용하며, \는 구분자로 공백을 넣을 경우는 구분자를 넣어줘야함.
set statusline=%F\ %y%m%r\ %=Line:\ %l/%L\ [%p%%]\ Col:%c\ Buf:%n

"활성화된 상태바 배경색 및 폰트색 설정
hi statusline ctermfg=White ctermbg=4 cterm=none 

" 윈도우가 2개 이상인 경우 비활성화된 윈도우의 배경색 및 폰트색 설정
hi statuslineNC ctermfg=White ctermbg=8 cterm=none 

" 마우스로 스크롤 및 리사이즈 가능. [n : Normal mode / v : Visual mode / i : Insert mode / a : All modes]
set mouse=a 

colorscheme jellybeans
set background=dark
set expandtab

"새로운 라인이 추가될 때, 이전 라인의 들여쓰기에 자동으로 맞춤. (= ai)
set autoindent 

"탭을 space로 확장 
set expandtab 

"탭으로 들여쓰기시 사용할 스페이스바 개수. (= ts)
set tabstop=2 

"<<, >> 으로 들여쓰기시 사용할 스페이스바 개수. (= sw)
set shiftwidth=2 

" 페이스바 n개를 하나의 탭으로 처리. (= sts)
"ex) 스페이스바 4개가 연속으로 있다면 백스페이스로 스페이스바를 지우면 스페이스바 4개를 하나의 탭으로 인식해 삭제.
set softtabstop=2 

"코드접기 활성화
set foldmethod=indent 

"vim-airline-----------------------------------------
"
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
"let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar
"
"---------------------------------------------------

"tagbar---------------------------------------------
"
" F12 를 tagbar 토글 키로 사용
map <F12> :TagbarToggle<CR>

" tagbar 가로 사이즈 설정
let g:tagbar_width=40
"system verilog tagbar setup
let g:tagbar_type_systemverilog = {
    \ 'ctagstype' : 'systemverilog',
    \ 'sro' : '::',
    \ 'kinds' : [
        \ 'c:classes',
        \ 't:tasks',
        \ 'f:functions',
        \ 'm:modules',
        \ 'p:programs',
        \ 'i:interfaces',
        \ 'e:typedefs',
        \ 'd:defines'
    \]
\}
"
"-------------------------------------------------


"//vim verilog instance---------------------------
"
"map F4 :g@i<CR> (
"
"-------------------------------------------------

"ale linter---------------------------------------
"
let g:ale_linters = {'systemverilog' : ['xvlog'],}
let g:ale_verilog_xvlog_options = '--sv'
"let g:ale_linters = {'verilog' : ['xvlog'],}
"
"-------------------------------------------------

""syntastic setup----------------------------------
 "
 "execute pathogen#infect()
 "let g:syntastic_verilog_include_dirs = ["includes", "headers"]
 "
 "
 ""let g:syntastic_verilog_checkers=["xvlog"] 
 ""let g:syntastic_verilog_vlog_args="-work modelSimProject/work" 
 "
 "let g:syntastic_systemverilog_checkers=["xvlog"] 
 "let g:syntastic_systemverilog_xvlog_args="~/Xilinx/Vivado/2022.1/bin/xvlog\ ./%" 
 "
 "
 "set statusline+=%#warningmsg#
 "set statusline+=%{SyntasticStatuslineFlag()}
 "set statusline+=%*
 "
 "let g:syntastic_always_populate_loc_list = 1
 "let g:syntastic_auto_loc_list            = 1
 "let g:syntastic_check_on_open            = 0
 "let g:syntastic_check_on_wq              = 0
 
 "let g:syntastic_verilog_checkers = ['verilator', 'iverilog']
 "let g:syntastic_verilog_checkers = ['iverilog']
 
 "if !filereadable(expand("%:p:h")."/Makefile")
 "  setlocal makeprg=~/Xilinx/Vivado/2022.1/bin/xvlog\ --sv\ ./%
 "  set      errorformat=error:\ [vrfc\ 10-%n]\ %m\ [%f:%l]
 "endif
 "map <F3> :w<CR> :make!<CR> :cw<CR>
 "map <f5> :make<cr>:copen 8<cr> 
 
 "let g:syntastic_verilog_checkers=["vlog"]
 "Path of ModelSim work library
 "let g:syntastic_verilog_vlog_args="~/Xilinx/Vivado/2022.1/bin/xvlog"
 
 "let g:syntastic_systemverilog_checkers=["vlog"]
 "Path of ModelSim work library
 "let g:syntastic_systemverilog_vlog_args="~/Xilinx/Vivado/2022.1/bin/xvlog" 
 "
 "------------------------------------------------

"terminal setup----------------------------------
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <F1> :call TermToggle(12)<CR>
inoremap <F1> <Esc>:call TermToggle(12)<CR>
tnoremap <F1> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
"--------------------------------------------------

"-------------------------------------------------
"//terminal 모드의 insert모드 나가기를 esc로 수행
"
"tnoremap <Esc> <C-\><C-n>
"
"-------------------------------------------------
