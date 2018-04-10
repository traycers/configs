" САЙТ ПЛАГИНОВ:
" http://vimawesome.com/

" УСТАНОВКА МЕНЕДЖЕРОВ ПЛАГИНОВ 
" VUNDLE
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" VIM-PLUG
" https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"

if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif


" отключение совместимости с vi
set nocompatible


"	ПЛАГИНЫ
" необходимо для vundle
call plug#begin()

" НАВИГАЦИЯ
" СУПЕР БЫСТРАЯ НАВИГАЦИЯ ПО ФАЙЛУ
Plug 'easymotion/vim-easymotion'

" ДЕРЕВО ФАЙЛОВ
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" ПАНЕЛЬ СТАТУСА
Plug 'bling/vim-airline'

" нечеткий поиск
Plug 'kien/ctrlp.vim'

" КОМЕНТИРОВАНИЕ
"Plug 'scrooloose/nerdcommenter'

" АВТОДОПОЛНЕНИЕ
" Plug 'valloric/youcompleteme'

" COFEE SCRIPT
"Plug 'kchmck/vim-coffee-script'

" RUBY ON RAILS
" Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Plug 'tpope/vim-rails', { 'for': 'ruby' }
" Plug 'tpope/vim-bundler', { 'for': 'ruby' }

" ЦВЕТОВЫЕ СХЕМЫ
Plug 'flazz/vim-colorschemes'
"Plug 'cocopon/iceberg.vim'
"Plug 'arcticicestudio/nord-vim'
" ОБРАТИТЬ ВНИМАНИЕ
" COMMAND-LINE FUZZY FINDER 
"Plug 'junegunn/fzf'
" ПОИСК ПО ФАЙЛАМ, АЛЬТЕРНАТИВА GREP
"Plug 'mileszs/ack.vim'
"Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'


call plug#end()

filetype plugin indent on

" НАСТРОЙКИ КЛАВИШИ Leader
:let mapleader="\<space>"
" НАСТРОЙКИ КЛАВИШИ Esc
"

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
set fileencodings=utf-8,cp1251,koi8-r,cp866
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
" set ignorecase
" set smartcase
" set incsearch
" set showmatch
" set hlsearch

" Включить подсветку невидимых символов
set list
" Используем символы как в TextMate для табуляции и конца строки
"set listchars=tab:>-,space:·,precedes:«,extends:»,trail:•,nbsp:␣
set listchars=tab:>-,precedes:«,extends:»,trail:•,nbsp:␣

" Включение автоматического перечитывания файла при изменении
set autoread

" временные файлы помещаются в:
set backupdir=~/.vim/temp//
set undodir=~/.vim/temp//
set directory=~/.vim/temp//

" Показывать все возможные кандидаты для выбора при авто-завершении команд в командной строке
set wildmenu
set wcm=<TAB>

" Открытие\закрытие новой вкладки по CTRL+T и CTRL+W
" nmap <C-t> :tabnew<CR>
" imap <C-t> <Esc>:tabnew<CR>a
" nmap <C-w> :tabclose<CR>
" imap <C-w> <Esc>:tabclose<CR>

" НАСТРОЙКА ПЛАГИНОВ
" AIRLINE
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
" EASYMOTION
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
" NERDTREE
map <C-n> :NERDTreeToggle<CR>

" Shortcuts for moving between tabs.
"noremap [ gT
"noremap ] gt

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" the buffer for copy between vim instances
vmap <leader>y :w! ~/.vim/temp.buffer<CR>
nmap <leader>p :r! cat ~/.vim/temp.buffer<CR>

if has("gui_running")
 set guioptions=
endif

" https://github.com/mokevnin/dotfiles/blob/master/files/vimrc 
