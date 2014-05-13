vim-fifo
========

An easy way to execute files through Vim and output their results to a shell fifo

Just add the name of the fifo to pipe to in your .vimrc and a shell script in your $PATH:

#vimrc

```viml
map <silent> <C-b> :call OutputFifo()<CR>
imap <silent> <C-b> <C-o>:call OutputFifo()<CR>
```
