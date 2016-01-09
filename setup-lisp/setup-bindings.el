(global-set-key (kbd "M-/") 'dabbrev-expand)
(global-set-key (kbd "M-?") 'hippie-expand)
(global-set-key (kbd "C-/") 'toggle-letter-case)
(global-set-key (kbd "M-)") 'delete-other-windows)
(global-set-key (kbd "<f5>") 'repeat)
(global-set-key (kbd "<C-f5>") 'repeat-complex-command)
(global-set-key (kbd "M-m") 'set-mark-command)
(global-set-key (kbd "C-l") 'goto-line)

(require 'open-next-line)
(global-set-key (kbd "M-b") 'newline-and-indent)
(global-set-key (kbd "M-B") 'open-next-line)
;; (global-set-key (kbd "M-b") 'open-next-line)
;; (global-set-key (kbd "M-B") 'open-previous-line)
;; (global-set-key (kbd "<RET>") 'newline-and-indent)
;; (add-hook 'shell-mode-hook (lambda () (local-unset-key (kbd "RET"))))
;; (global-set-key (kbd "<RET>") 'newline-and-indent)
;; (global-set-key (kbd "M-b") 'end-line-and-newline-and-indent)
;; (global-set-key (kbd "M-b") 'open-next-line)
;; (global-set-key (kbd "M-B") 'open-previous-line)

(global-set-key (kbd "M-D") 'kill-whole-line)
(global-set-key (kbd "<M-return>") (kbd "C-c C-c"))
(global-set-key (kbd "M-7") 'backward-sexp)
(global-set-key (kbd "M-9") 'forward-sexp)
(global-set-key (kbd "M-F") 'find-file-at-point)
(global-set-key (kbd "C-S-r") 'revert-buffer)
(global-set-key (kbd "C-`") 'ibuffer)

(global-set-key (kbd "M-~") 'ivy-recentf)
(global-set-key (kbd "C-S-o") 'recentf-open-files)

(global-set-key (kbd "<C-f7>") 'next-error)
(global-set-key (kbd "<C-S-f7>") 'previous-error)

(global-set-key (kbd "<S-f10>") 'menu-bar-mode)

;; (global-set-key (kbd "M-K") (lambda () (interactive) (forward-visible-line 20)))
;; (global-set-key (kbd "M-I") (lambda () (interactive) (forward-visible-line -20)))

(global-set-key (kbd "M-K") (lambda () (interactive) (next-line 20)))
(global-set-key (kbd "M-I") (lambda () (interactive) (previous-line 20)))

;; (global-set-key (kbd "M-SPC") (lambda () (interactive) (set-mark-command t)))
(global-set-key (kbd "M-SPC") (lambda () (interactive) (exchange-point-and-mark-no-activate)))

;; (global-set-key (kbd "M-1") (lambda () (interactive)
;;                   (set-input-method (inactivate-input-method))))
;; (global-set-key (kbd "M-2") (lambda () (interactive)
;;                   (set-input-method 'russian-computer)))
;; (global-set-key (kbd "M-3") (lambda () (interactive)
;;                   (set-input-method 'ukrainian-computer)))

(require 'basic-edit-toolkit)
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

(provide 'setup-bindings)
