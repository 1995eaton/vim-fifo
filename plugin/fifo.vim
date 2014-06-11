if !exists("g:fifo_file")
  let g:fifo_file = "/tmp/vim.fifo"
endif

function ClearFifo()
  if filereadable((g:fifo_file))
    execute "silent !echo clear >" . g:fifo_file
    redraw!
  endif
endfunction

function FifoRun()
  if filereadable(g:fifo_file)
    if &filetype == "python"
      execute "silent !echo 'python %:p'>" . g:fifo_file
    elseif &filetype == "javascript"
      execute "silent !echo 'node %:p'>" . g:fifo_file
    elseif &filetype == "ruby"
      execute "silent !echo 'ruby %:p'>" . g:fifo_file
    elseif &filetype == "sh" || &filetype == "zsh"
      execute "silent !echo '" . join(getline(1,'$'), "\\\n") . "' >" . g:fifo_file
    elseif &filetype == "perl"
      execute "silent !echo 'perl %:p'>" . g:fifo_file
    endif
    redraw!
  endif
endfunction

nnoremap <C-m> :call FifoRun()<CR>
nnoremap <C-l> :call ClearFifo()<CR>
