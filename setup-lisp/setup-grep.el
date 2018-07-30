(eval-after-load 'grep '(add-to-list 'grep-find-ignored-directories "node_modules"))

(setq rg-command-line-flags '("-S -M1000"))
(setq counsel-rg-base-command "rg --no-heading --line-number -S -M1000 %s .")

(provide 'setup-grep)
