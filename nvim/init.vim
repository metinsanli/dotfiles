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

