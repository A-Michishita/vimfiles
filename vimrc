set backspace=indent,eol,start
"インデントで折りたたみ
set foldcolumn=2
set foldmethod=indent
" neobundle settings {{{
if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'nanotech/jellybeans.vim'

" ツリー状のファイル表示機能を提供します
NeoBundle 'scrooloose/nerdtree'

" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" 選択範囲をまとめてコメントアウト"
NeoBundle 'tomtom/tcomment_vim'

" markdown環境の整備"
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
augroup PrevimSettings
autocmd!
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" JSON環境の整備
NeoBundle 'JSON.vim'

"HTML/CSS環境整備
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'

" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()

filetype plugin indent on
set t_Co=256
syntax on
colorscheme jellybeans
" タブの設定を変更します
set tabstop=2
" タブを挿入するときの幅
set shiftwidth=2
" タブをスペースとして扱う
set expandtab 
set autoindent
" 行番号表示
set number
" 文字コードの自動認識
set encoding=utf-8
set fileencodings=utf-8
au BufRead,BufNewFile *.md set filetype=markdown
au! BufRead,BufNewFile *.ejs set filetype=html
au! BufRead,BufNewFile *.json set filetype=json
autocmd Filetype json setl conceallevel=0
let g:user_emmet_settings = {
\   'lang' : 'ja'
\ }
