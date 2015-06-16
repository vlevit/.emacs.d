(require 'magit)

(setq magit-last-seen-setup-instructions "1.4.0")

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-g") 'magit-status)

(setq magit-diff-refine-hunk t)

(define-key magit-mode-map (kbd "<S-return>")
  '(lambda () (interactive) (magit-visit-item 1) (other-window -1)))
(define-key magit-mode-map (kbd "M-RET")
  '(lambda () (interactive) (magit-visit-item 1)))

(provide 'setup-git)
