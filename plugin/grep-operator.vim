
nnoremap <leader>g :set operatorfunc=<SID>LeadFgrep<cr>g@<cr>
vnoremap <leader>g :<c-u>call <SID>LeadFgrep(visualmode())<cr>

function! s:GrepOperator(type)
    echom &filetype    
    let saved_unnamed_register = @@

    let inc = " "

    echom "***"
    if &filetype ==# 'c'
        let inc = " --include=*.c --include=*.h"
    endif

    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif
    echom shellescape(@@)
    execute "grep! -R " . shellescape(@@) . " ." . inc
    copen

    let @@ = saved_unnamed_register
endfunction

function! s:LeadFgrep(type)
    if a:type ==# 'v'
        let saved_unnamed_register = @@
        execute "normal! `<v`>y"
        exe "Leaderf rg -e " . shellescape(@@)
        let @@ = saved_unnamed_register
    elseif a:type ==# 'line'
        let s:wd=expand("<cword>")
        exe "Leaderf rg -e " . s:wd
    endif
endfunction

