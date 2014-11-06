(require 'shell-command)
(shell-command-completion-mode)

(autoload 'bash-completion-dynamic-complete 
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
  'bash-completion-dynamic-complete)
(add-hook 'shell-command-complete-functions
  'bash-completion-dynamic-complete)

(define-key shell-mode-map (kbd "M-R") 'comint-history-isearch-backward-regexp)

(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)

(provide 'setup-shell)
