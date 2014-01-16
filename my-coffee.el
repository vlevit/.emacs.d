(require 'coffee-mode)
(require 'flymake-coffee)

(defun my-coffee-hook ()
  (setq tab-width 2)
  (setq coffee-tab-width 2)
  (flymake-mode-on)
  (flymake-coffee-load))

(add-hook 'coffee-mode-hook 'my-coffee-hook)
;; (add-hook 'coffe-mode-hook 'flymake-mode-on)
;; (add-hook 'coffee-mode-hook 'flymake-coffee-load)

(provide 'my-coffee)
