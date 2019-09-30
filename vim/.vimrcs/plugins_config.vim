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

Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'amix/open_file_under_cursor.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flowtype/vim-flow'
Plug 'itchyny/lightline.vim' 
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'maximbaz/lightline-ale'
Plug 'metakirby5/codi.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()  


au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme gruvbox
"set background=dark 

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'vendor\|node_modules\|^\.DS_Store\|^\.git\|target\|content'
let g:ctrlp_user_command = 'cd %s;
      \ commonfilter="\.(jpg|bmp|png|jar|7z|zip|tar|gz|tgz|bz)$";
      \ if [ ! -r ".ctrlpignore" ]; then
      \   find . -type f | grep -Evi "$commonfilter";
      \ else
      \   find . -type f | grep -vF "$(cat .ctrlpignore)" | grep -Evi "$commonfilter";
      \ fi'



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
let g:lightline = {}

let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ ['lineinfo'], [
      \     'percent',
      \     'linter_checking',
      \     'linter_errors',
      \     'linter_warnings',
      \     'linter_ok'
      \     ]
      \   ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_expand': {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
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
" => ALE 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1
nmap <Leader>py <Plug>(Prettier)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_max_signs = 500

"let g:gitgutter_enabled=0
"nnoremap <silent> <leader>d :GitGutterToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>an :ALENext<cr>
nmap <silent> <leader>aN :ALEPrevious<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-javascript (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_flow = 1


