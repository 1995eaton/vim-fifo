if !exists("g:run_fifo")
  let g:run_fifo = "/tmp/vim-run_fifo"
endif

function OutputFifo()
  if filereadable(g:run_fifo)
    let ftype = &filetype
    if ftype == "javascript"
      execute "silent !echo `clear && node %` >" . g:run_fifo
    elseif ftype == "python"
      execute "silent !echo `clear && python %` >" . g:run_fifo
    elseif ftype == "ruby"
      execute "silent !echo `clear && ruby %` >" . g:run_fifo
    endif
    redraw!
  endif
endfunction

if exists("g:run_exec_on_write") && g:run_exec_on_write == 1
  autocmd BufWritePost * call OutputFifo()
endif
