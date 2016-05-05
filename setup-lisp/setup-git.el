(require 'magit)

(setq magit-last-seen-setup-instructions "1.4.0")

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-g") 'magit-status)

(setq magit-diff-refine-hunk t
      magit-status-expand-stashes nil)

(define-key magit-mode-map (kbd "<S-return>")
  '(lambda () (interactive) (magit-visit-item 1) (other-window -1)))
(define-key magit-mode-map (kbd "M-RET")
  '(lambda () (interactive) (magit-visit-item 1)))

(key-seq-define magit-mode-map "`1" 'magit-show-level-1-all)
(key-seq-define magit-mode-map "`2" 'magit-show-level-2-all)
(key-seq-define magit-mode-map "`3" 'magit-show-level-3-all)

(provide 'setup-git)
