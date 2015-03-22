(require 'smartparens)

(require 'smartparens-config)
(smartparens-global-mode t)

(setq sp-highlight-pair-overlay nil)
;;; re-wrap region with any pair
(setq sp-wrap-repeat-last 2)

(provide 'setup-smartparens)
