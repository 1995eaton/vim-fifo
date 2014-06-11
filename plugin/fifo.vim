if !exists("g:fifo_file")
  let g:fifo_file = "/tmp/vim.fifo"
endif

function FifoRun()
  if &filetype == "python"
    execute "silent !echo 'python %'>" . g:fifo_file
  elseif &filetype == "javascript"
    execute "silent !echo 'node %'>" . g:fifo_file
  elseif &filetype == "ruby"
    execute "silent !echo 'ruby %'>" . g:fifo_file
  endif
  redraw!
endfunction

nnoremap <C-m> :call FifoRun()<CR>
