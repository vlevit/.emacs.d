(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-g") 'magit-status)

(setq magit-diff-refine-hunk t)


(provide 'my-git)
