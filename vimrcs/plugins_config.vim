"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important: 
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
call pathogen#infect('~/.vim_runtime/sources_non_forked/{}')
call pathogen#helptags()

""""""""""""""""""""""""""""""
" => taglist
""""""""""""""""""""""""""""""
map <F3> :TlistToggle<CR>
"let Tlist_Auto_Open=1 
"let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_SingleClick=1


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""
" => MiniBufExplorer
""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplMoreThanOne=0


""""""""""""""""""""""""""""""
" => OmniCppComplete
""""""""""""""""""""""""""""""
set nocp


""""""""""""""""""""""""""""""
" => SuperTab
""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType="context"


""""""""""""""""""""""""""""""
" => winmanager
""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout='FileExplorer|TagList'
"let g:persistentBehaviour=0
"let g:winManagerWidth=30
"let g:defaultExplorer=1
"nmap <silent> <F8> :WMToggle<cr>


""""""""""""""""""""""""""""""
" => Nerd Tree
""""""""""""""""""""""""""""""
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"

