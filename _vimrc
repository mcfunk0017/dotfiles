syntax on
filetype indent plugin on
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set hidden
set wildmode=longest,list
map <F1> :bp<CR>
map <F2> :bn<CR>

au BufWritePost,FileWritePost /path/to/local/files/* silent call UploadOnSave()
au BufWritePost,FileWritePost /another/path/to/local/files/* silent call UploadOnSave()
function UploadOnSave()
    let filename = expand("%:p")
    let dest = substitute(filename, 'marshal', '$REMOTE_USER$', '')
    exec ":silent !scp -q '" . filename . "' '$HOSTNAME$:" . dest . "'"
endfunction
