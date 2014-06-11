vim-fifo
========

An easy way to execute files through Vim and output their results to a shell fifo

Just add these lines to your $SHELL's rc file:

```bash
VIM_FIFO_FILE="/tmp/vim.fifo"

function ctrl_c_trap() {
  rm $VIM_FIFO_FILE
  trap - INT
}

function vim_fifo() {
  mkfifo $VIM_FIFO_FILE
  trap ctrl_c_trap INT
  while [[ -e $VIM_FIFO_FILE ]]; do
    $(tail $VIM_FIFO_FILE)
  done
}
alias vimfifo="vim_fifo"
```

###vimrc

```viml
let g:fifo_file = "/tmp/vim.fifo" "Default fifo file
```

###Running vim-fifo

 * After you have the script in your rc file, run the ```vimfifo``` command
 * Press ```<C-m>``` to execute the current file in vim

###Supported File Types

 * Python
 * Ruby
 * JavaScript (through node)
