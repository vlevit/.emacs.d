(defun my-coffee-hook ()
  (setq tab-width 2)
  (setq coffee-tab-width 2)
  (flymake-mode-on)
  (flymake-coffee-load))

(add-hook 'coffee-mode-hook 'my-coffee-hook)

(provide 'setup-coffee)
