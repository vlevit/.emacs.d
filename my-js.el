(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(define-key js2-mode-map (kbd "M-.") 'ido-imenu)

(provide 'my-js)
