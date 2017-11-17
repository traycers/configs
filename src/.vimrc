" Установка менеджера плагинов vim
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Сайт плагинов:
" http://vimawesome.com/




" отключение совместимости с vi
set nocompatible


"	НАСТРОЙКА СПИСКА ПЛАГИНОВ
" необходимо для vundle
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" дерево файлов
Plugin 'scrooloose/nerdtree'
" супер быстрая навигация по файлу
Plugin 'easymotion/vim-easymotion'
" панель статуса
Plugin 'bling/vim-airline'
" коментирование
"Plugin 'scrooloose/nerdcommenter'
" автодополнение
"Plugin 'valloric/youcompleteme'
" cofee script
"Plugin 'kchmck/vim-coffee-script'
" Ruby on Rails
"Plugin 'tpope/vim-rails'
"Plugin 'vim-ruby/vim-ruby'
" цветовые схемы
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
"Plugin 'cocopon/iceberg.vim'
"Plugin 'arcticicestudio/nord-vim'
Plugin 'junegunn/fzf'
Plugin 'mileszs/ack.vim'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"	ДАЛЬШЕ МОИ НАСТРОЙКИ
" включение синтаксиса
"syntax on
syntax enable
"set background=dark
colorscheme iceberg
" показывать команду
set showcmd
" показывать строку с курсором
set ruler
" кодировка по умолчанию
set encoding=utf8
" Список кодировок файлов для авто-определения
set fileencodings=utf-8,koi8-r,cp1251,cp866
" отображение номеров строк относительно позиции курсора
set relativenumber
" файлы содержат информацию для отмены выполненных действий, так что вы сможете отменять действия даже после того как закроете и откроете файл.
set undofile
" отображение статус строки
set laststatus=2
" Показывать первую парную скобку после ввода второй
set showmatch
" Показывать строку вкладок всегда
set showtabline=2
" Показывать имя буфера в заголовке терминала
set title

"	ОТСТУПЫ
" Включаем 'умную' автоматическую расстановку отступов
"set smartindent
" Копирует отступ от предыдущей строки » наследовать отступы предыдущей строки
set autoindent
" Размер табуляции
set tabstop=2
" Размер сдвига при нажатии на клавиши «<» и «>»
set shiftwidth=2
set softtabstop=2
set expandtab

"	ПОИСК
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Включить подсветку невидимых символов
set list
" Используем символы как в TextMate для табуляции и конца строки
"set listchars=tab:>-,space:·,precedes:«,extends:»,trail:•,nbsp:␣
set listchars=tab:>-,precedes:«,extends:»,trail:•,nbsp:␣

" Включение автоматического перечитывания файла при изменении
set autoread
" временные файлы помещаются в:
"set backupdir=~/.vim/backup/

" Показывать все возможные кандидаты для выбора при авто-завершении команд в командной строке
set wildmenu
set wcm=<TAB>

" Открытие\закрытие новой вкладки по CTRL+T и CTRL+W
" nmap <C-t> :tabnew<CR>
" imap <C-t> <Esc>:tabnew<CR>a
" nmap <C-w> :tabclose<CR>
" imap <C-w> <Esc>:tabclose<CR>

" НАСТРОЙКА ПЛАГИНОВ
let g:airline#extensions#tabline#enabled = 1
"
"
" КОМБИНАЦИИ КЛАВИШ
function RunWith (command)
  execute "w"
  execute "!clear;time " . a:command . " " . expand("%")
endfunction

autocmd FileType coffee nmap <F5> :call RunWith("coffee")<cr>
autocmd FileType ruby   nmap <F5> :call RunWith("ruby")<cr>


" НАСТРОЙКИ КЛАВИШИ Leader
:let mapleader="\<space>"

" НАСТРОЙКИ ПЛАГИНА EASYMOTION
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


if has("gui_running")
 set guioptions=
endif
