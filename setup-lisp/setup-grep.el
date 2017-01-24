(eval-after-load 'grep '(add-to-list 'grep-find-ignored-directories "node_modules"))

(setq ripgrep-arguments '("-S"))

(provide 'setup-grep)
