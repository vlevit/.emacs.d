(require 'vline)

(set-face-background 'vline "#f0e9d7")
(set-face-background 'vline-visual "#f0e9d7")

(setq vline-use-timer nil)

(global-set-key (kbd "M-g M-v") 'vline-mode)

(provide 'my-vline)
