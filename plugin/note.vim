
nnoremap <leader>c :set operatorfunc=<SID>note<cr>g@<cr>
vnoremap <leader>c :<c-u>call <SID>note(visualmode())<cr>

function! s:note(type)
	let l:pre = ''

    if a:type ==# 'v' || a:type ==# 'V'
		let l:start_line = getpos("'<")[1]
		let l:wd = getline(l:start_line)
		let l:pre = "'\<,'\>"
    elseif a:type ==# 'line'
        let l:wd=getline(".")
    endif

	if l:wd ==# ''
		echom "empty"
		return
	endif

	let l:pre_str = matchstr(l:wd,"^\\s*")

    let l:count = ""
    let l:pat = ""
    if &filetype ==# 'c' || &filetype ==# 'cpp' || &filetype ==# 'javascript'
        let l:pat = "\\\/\\\/"
        let l:str = "\\/\\/"
        let l:ins = "\/\/"
    elseif &filetype ==# 'vim'
        let l:pat = "\""
        let l:str = "\\\""
	elseif &filetype ==# 'sh' || &filetype ==# 'py' || &filetype ==# 'snscript'
        let l:pat = "#"
        let l:str = '#'
    endif

    let l:count = match(l:wd,"^\\s*" . l:pat)

    if l:count ==# -1
        exe l:pre . "s/^" . l:pre_str . "/" . l:pre_str . l:pat .  "/"
    else
        exe l:pre . "s/^\\(\\s*\\)" . l:str . "/\\1/"
    endif
endfunction
