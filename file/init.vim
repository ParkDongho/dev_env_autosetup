"vim plug-----------------------------------------------
"
call plug#begin('~/.vim/plugged') " 플러그인 시작
"NERDTree
Plug 'preservim/nerdtree'

"Color Scheme
Plug 'nanotech/jellybeans.vim'
Plug 'jpo/vim-railscasts-theme'
Plug 'morhetz/gruvbox'

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

"vim indentGuides & indentLine--------------
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
"-------------------------------------------

"vim devicons
"NERDTree의 파일 확장자 아이콘
Plug 'ryanoasis/vim-devicons'

"vim diminactive 
Plug 'blueyed/vim-diminactive'

"vim startify
Plug 'mhinz/vim-startify'

"nvim telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" or                                , { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-file-browser.nvim'

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
" set relativenumber 

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

"colorscheme railscasts
"colorscheme jellybeans

"colorscheme gruvbox--------------------------
colorscheme gruvbox
set background=dark
"---------------------------------------------


"vim-airline-----------------------------------------
"
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
"let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar
nnoremap <F5> :enew<Enter>          " 새로운 버퍼를 연다
nmap “ :bprevious!<Enter>    " 이전 버퍼로 이동
nmap ‘ :bnext!<Enter>        " 다음 버퍼로 이동
nnoremap <F2> :bp <BAR> bd #<Enter> " 현재 버퍼를 닫고 이전 버퍼로 이동
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

"vim-startify에서 NERDTree의 Bookmark를 활용---------
let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")
"--------------------------------------------------

"vim indent guides----------------------------
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
"----------------------------------------------
"vim indent line-------------------------------
"color scheme
"let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'SpecialKey'

"charater shape
let g:indentLine_char = '┊'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0
"--------------------------------------------

"Coc.vim-------------------------------------
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1):
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" 
" " Make <CR> to accept selected completion item or notify coc.nvim to format
" " <C-g>u breaks current undo, please make your own choice.
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"---------------------------------

"Telescope------------------------
nnoremap <F3> :Telescope find_files theme=dropdown hidden=false<CR>

