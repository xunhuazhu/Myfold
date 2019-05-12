
function MyFoldtext()
	let s:lines = v:foldend - v:foldstart + 1
	let s:start = getline(v:foldstart)
	let s:level = v:foldlevel
	let s:_result = s:start . '  +' . s:lines . ' lines'
	let s:result = substitute(s:_result,'	','','g')
	while s:level > 0
		let s:result = '    ' . s:result
		let s:level -= 1
	endwhile
	return s:result
	"return s:start
endfunction
set foldtext=MyFoldtext()
