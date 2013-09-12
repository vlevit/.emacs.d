(require 'highlight-symbol)

;; (define-global-minor-mode global-highlight-symbol-mode
;;   highlight-symbol-mode (lambda () (highlight-symbol-mode 1)))
;; (global-highlight-symbol-mode)

(setq highlight-symbol-idle-delay 2)

(defun highlight-symbol-turn-on ()
  (highlight-symbol-mode 1))

;; (add-hook 'text-mode-hook 'highlight-symbol-turn-on)
;; (add-hook 'prog-mode-hook 'highlight-symbol-turn-on)

;; (add-hook 'Man-mode-hook (lambda () (highlight-symbol-mode 0)))
(global-set-key (kbd "M-]") 'highlight-symbol-next)
(global-set-key (kbd "M-[") 'highlight-symbol-prev)

(provide 'my-highlight-symbol)
