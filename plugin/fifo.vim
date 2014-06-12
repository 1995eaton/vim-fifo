if !exists("g:fifo_file")
  let g:fifo_file = "/tmp/vim.fifo"
endif

function ClearFifo()
  if filereadable((g:fifo_file))
    call system("echo clear > " . g:fifo_file)
  endif
endfunction

function FifoRun()
  let l:current_file = expand("%:p")
  if filereadable(g:fifo_file)
    if &filetype == "python"
      call system("echo \"python " . l:current_file . "\" > " . g:fifo_file)
    elseif &filetype == "javascript"
      call system("echo \"node " . l:current_file . "\" > " . g:fifo_file)
    elseif &filetype == "ruby"
      call system("echo \"ruby " . l:current_file . "\" > " . g:fifo_file)
    elseif &filetype == "sh" || &filetype == "zsh"
      call system("echo '" . join(getline(1,'$'), "\n") . "' >" . g:fifo_file)
    elseif &filetype == "perl"
      call system("echo \"perl " . l:current_file . "\" > " . g:fifo_file)
    endif
  endif
endfunction

nnoremap <C-m> :call FifoRun()<CR>
nnoremap <C-l> :call ClearFifo()<CR>
