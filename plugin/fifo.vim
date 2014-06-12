if !exists("g:fifo_file")
  let g:fifo_file = "/tmp/vim.fifo"
endif

function ClearFifo()
  if filereadable((g:fifo_file))
    call system("echo clear > " . g:fifo_file)
  endif
endfunction

function FifoRun()
  if exists("g:vimfifo#" . expand("%:e"))
    execute "let l:command = g:vimfifo#" . expand("%:e")
    call system("echo '" .
          \ substitute(l:command, "%s", expand("%:p"), "g") .
          \ "' > " . g:fifo_file)
  endif
endfunction

let g:vimfifo#py = "python %s"
let g:vimfifo#js = "node %s"
let g:vimfifo#sh = "sh %s"
let g:vimfifo#zsh = "zsh %s"
let g:vimfifo#tcsh = "tcsh %s"
let g:vimfifo#bash = "bash %s"
let g:vimfifo#perl = "perl %s"
let g:vimfifo#hs = "runhaskell %s"
let g:vimfifo#cpp = "g++ %s -o /tmp/vimfifo.out && /tmp/vimfifo.out && rm /tmp/vimfifo.out"
let g:vimfifo#c = "gcc %s -o /tmp/vimfifo.out && /tmp/vimfifo.out && rm /tmp/vimfifo.out"

nnoremap <C-m> :call FifoRun()<CR>
nnoremap <C-l> :call ClearFifo()<CR>
