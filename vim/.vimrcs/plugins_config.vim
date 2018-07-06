"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" # Use vim-plug as package 
"   manager
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" # Load plugins
"   Shorthand notation; 
"   Plug 'yyy/xxx'
"   fetches 
"   https://github.com/yyy/xxx
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'ajh17/Spacegray.vim'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim' 
Plug 'ctrlpvim/ctrlp.vim'
Plug 'amix/open_file_under_cursor.vim'
Plug 'vim-syntastic/syntastic'
Plug 'mxw/vim-jsx'
Plug 'flowtype/vim-flow'
Plug 'sheerun/vim-polyglot'
Plug 'mustache/vim-mustache-handlebars'
Plug 'metakirby5/codi.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rust-lang/rust.vim'
Plug 'timonv/vim-cargo'
Plug 'racer-rust/vim-racer'

" HTML
Plug 'mattn/emmet-vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'

call plug#end()  


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
 let g:ctrlp_working_path_mode = 0
 
 let g:ctrlp_map = '<c-f>'
 map <leader>j :CtrlP<cr>
 map <c-b> :CtrlPBuffer<cr>

 let g:ctrlp_max_height = 20
 let g:ctrlp_custom_ignore = 'vendor\|node_modules\|^\.DS_Store\|^\.git'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:NERDTreeWinPos = "left"
 let NERDTreeShowHidden=0
 let NERDTreeIgnore = ['\.pyc$', '__pycache__']
 let g:NERDTreeWinSize=35
 map <leader>nn :NERDTreeToggle<cr>
 map <leader>nb :NERDTreeFromBookmark<Space>
 map <leader>nf :NERDTreeFind<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }

 let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
" let g:syntastic_python_checkers=['pyflakes']

" Javascript
 let g:syntastic_javascript_checkers = ['eslint']

" HTML
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" Go
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
" let syntastic_mode_map = { 'passive_filetypes': ['html']  }

" Custom CoffeeScript SyntasticCheck
" func! SyntasticCheckCoffeescript()
"    let l:filename = substitute(expand("%:p"), '\(\w\+\)\.coffee', '.coffee.\1.js', '')
"    execute "tabedit " . l:filename
"    execute "SyntasticCheck"
"    execute "Errors"
" endfunc
" nnoremap <silent> <leader>c :call SyntasticCheckCoffeescript()<cr>

" Syntatic doesn't support mustache ?!?!
" let g:mustache_abbreviations = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => pangloss vim-javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_max_signs = 500

 "let g:gitgutter_enabled=0
 "nnoremap <silent> <leader>d :GitGutterToggle<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-javascript (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_flow = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rust Lang 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
