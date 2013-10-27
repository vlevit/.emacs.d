(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require 'js2-refactor)
(js2r-add-keybindings-with-modifier "C-S-")

(define-key js2-mode-map (kbd "M-.") 'ido-imenu)

(provide 'my-js)
