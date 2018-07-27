(eval-after-load 'grep '(add-to-list 'grep-find-ignored-directories "node_modules"))

(setq rg-command-line-flags '("-S -M1000"))

(provide 'setup-grep)
