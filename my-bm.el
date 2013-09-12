(require 'bm)
(global-set-key (kbd "<S-f5>") 'bm-toggle)
(global-set-key (kbd "<f6>") 'bm-next)
(global-set-key (kbd "<S-f6>") 'bm-previous)
(setq bm-highlight-style 'bm-highlight-only-fringe)

(provide 'my-bm)
