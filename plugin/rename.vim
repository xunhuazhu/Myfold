function! s:Rename()
  let new_file_name = input('New filename: ')
  let full_path_current_file = expand("%:p")
  let new_full_path = expand("%:p:h")."/".new_file_name
  bd    
  execute "!mv ".full_path_current_file." ".new_full_path
  execute "e ".new_full_path
endfunction                                                                                                                                                                                                                                 

command! Rename :call s:Rename()
nmap RN :Rename<CR>

