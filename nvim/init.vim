" ----------------------------------------------- NEOVIM

set number " Satir numaralarini gosterir
set signcolumn=yes " Sol kenar sutununu her zaman gosterir (hata isaretleri icin)
set expandtab " Tab tusuna basildiginda, tab yerine bosluk karakteri ekler
set tabstop=4 " Goruntulenen tab genisligini belirtilen kadar yapar
set shiftwidth=4 " Otomatik girintide belirtilen kadar bosluk kullanir
set softtabstop=4 " Tab tusuna basildiginda belirtilen kadar bosluk ekler
set encoding=utf-8 " Neovim'in dahili kodlamasini secilen yapar
set fileformat=unix " Satir sonu karakterini Unix/DOS/Mac formatina ayarlar
set fileencoding=utf-8 " Dosya kaydolurken formatini secilene zorlar
set nobackup " Dosya duzenlenmeden once yedek olusturulmasini engeller
set nowritebackup " Kaydetme sirasinda gecici yedek olusturmaz

colorscheme torte " Renk semasini secer
syntax on " Sozdizimi vurgulamayi aktiflestirir (kodlari renklendirir)
filetype on " Dosya tiplerini algilar ve uygun sözdizimi vurgulama ve diger ayarlari yukler
filetype plugin indent on " Dosya tiplerine ozel otomatik girinti ozelligini etkinlestirir (python, java vs icin farkli olabilir)

let g:loaded_ruby_provider = 0 " Ruby dili destegini devre disi birakir
let g:loaded_perl_provider = 0 " Perl dili destegini devre disi birakir


" ----------------------------------------------- VIM-PLUG

call plug#begin()
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'tpope/vim-fugitive'
call plug#end()


" ----------------------------------------------- AIRLINE

let g:airline_theme='serene' 
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#enabled = 0

" ----------------------------------------------- COC-NVIM

inoremap <silent><expr> <TAB> 
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" : 
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>" 
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Ctrl+Space ile otomatik tamamlama menusunu manuel tetikler. 
inoremap <silent><expr> <c-space> coc#refresh()

" Bir önceki/sonraki hata veya uyarıya git.
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

" Imlecin altindaki sembolun tanımına/Tip tanimina/Implementasyona/Referans
" oldugu yerleri goster
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Hover dokumantasyonunu goster.
nnoremap <silent> K :call ShowDocumentation()<CR>

" Coc hover saglayicisi varsa onu kullan, yoksa Vim'in varsayilan K davranisini kullan.
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Imlec bir sure hareketsiz kaldiginda ayni sembolleri vurgula
autocmd CursorHold * silent call CocActionAsync('highlight')

" Sembol ismi değiştir
nmap <leader>rn <Plug>(coc-rename)

" Secili kodu bicimlendir (visual ve normal modda)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>as  <Plug>(coc-codeaction-source)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <leader>cl  <Plug>(coc-codelens-action)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

