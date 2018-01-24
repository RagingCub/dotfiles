if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    " au! commands to set the filetype go here
    au! BufNewFile,BufRead *.bat,*.sys setf dosbatch
    au! BufNewFile,BufRead *.csv setf csv
    au! BufNewFile,BufRead .bash_functions setf sh
augroup END
