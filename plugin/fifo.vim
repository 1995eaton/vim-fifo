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
  if exists("g:vimfifo#" . expand("%:e"))
    execute "let l:command = g:vimfifo#" . expand("%:e")
    let l:command = substitute(l:command, "%s", l:current_file, "g")
    call system("echo \"" . l:command . "\" > " . g:fifo_file)
  elseif filereadable(g:fifo_file)
    if &filetype == "python"
      call system("echo \"python " . l:current_file . "\" > " . g:fifo_file)
    elseif &filetype == "javascript"
      call system("echo \"node " . l:current_file . "\" > " . g:fifo_file)
    elseif &filetype == "ruby"
      call system("echo \"ruby " . l:current_file . "\" > " . g:fifo_file)
    elseif &filetype == "sh" || &filetype == "zsh" || &filetype == "tcsh" || &filetype == "csh"
      call system("echo '" . join(getline(1,'$'), "\n") . "' >" . g:fifo_file)
    elseif &filetype == "perl"
      call system("echo \"perl " . l:current_file . "\" > " . g:fifo_file)
    elseif &filetype == "cpp"
      call system("echo \"g++ " . l:current_file . " -o /tmp/vimfifo.out && /tmp/vimfifo.out && rm /tmp/vimfifo.out\" >" . g:fifo_file)
    elseif &filetype == "c"
      call system("echo \"gcc " . l:current_file . " -o /tmp/vimfifo.out && /tmp/vimfifo.out && rm /tmp/vimfifo.out\" >" . g:fifo_file)
    elseif &filetype == "haskell"
      call system("echo \"runhaskell " . l:current_file . "\" > " . g:fifo_file)
    endif
  endif
endfunction

nnoremap <C-m> :call FifoRun()<CR>
nnoremap <C-l> :call ClearFifo()<CR>
