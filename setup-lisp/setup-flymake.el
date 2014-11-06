;; (add-hook 'find-file-hook 'flymake-find-file-hook)
(load-library "flymake-cursor")
(setq flymake-no-changes-timeout 2)

(global-set-key (kbd "<C-f6>")   'flymake-goto-next-error)
(global-set-key (kbd "<C-S-f6>") 'flymake-goto-prev-error)

(add-hook 'python-mode-hook 'flymake-mode-on)
(provide 'setup-flymake)
