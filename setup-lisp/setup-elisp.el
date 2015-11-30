(define-key emacs-lisp-mode-map (kbd "M-.") 'find-function-at-point)

(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

(eval-after-load "lispy"
  (lambda ()
    (define-key lispy-mode-map (kbd "M-m") nil)))

(provide 'setup-elisp)
