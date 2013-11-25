(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-g") 'magit-status)

(setq magit-diff-refine-hunk t)

(require 'git-gutter-fringe)
(global-git-gutter-mode t)

;; Jump to next/previous hunk
(global-set-key (kbd "C-c p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-c n") 'git-gutter:next-hunk)

(provide 'my-git)
