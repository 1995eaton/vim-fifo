vim-fifo
========

An easy way to execute files through Vim and output their results to a shell fifo

Just add the name of the fifo to pipe to in your .vimrc and a shell script in your $PATH:

###vimrc

```viml
let g:run_fifo = "/tmp/vim-run_fifo"
let g:run_exec_on_write = 1 "Executes the file if a fifo exists after writing the current file

map <silent> <C-b> :call OutputFifo()<CR>
imap <silent> <C-b> <C-o>:call OutputFifo()<CR>
```

###Running vim-fifo

 * After you have the following lines in your vimrc, run the vimfifo.sh file and open a terminal in another window.
 * Press ```<C-b>``` to execute the current file, the output should appear in the terminal running the vimfifo.sh script.

###Supported File Types

 * Python
 * Ruby
 * JavaScript (node.js)
