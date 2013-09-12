(setq hippie-expand-try-functions-list 
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-line
        try-expand-list
        try-expand-line-all-buffers
        try-expand-list-all-buffers))

(provide 'my-hippie-expand)
