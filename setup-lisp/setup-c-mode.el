(add-hook 'c-mode-hook
          (lambda () (local-set-key (kbd "C-c C-c") 'compile)))
(add-hook 'c++-mode-hook
          (lambda () (local-set-key (kbd "C-c C-c") 'compile)))

(provide 'setup-c-mode)
