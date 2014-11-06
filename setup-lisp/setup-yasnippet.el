(require 'yasnippet)

(setq yas-snippet-dirs '("~/.emacs.d/mysnippets" "~/.emacs.d/snippets"))
;; Map `yas/load-directory' to every element

;; JIT (on demand) loading of snippets
(yas-load-directory "~/.emacs.d/mysnippets" t)
(yas-load-directory "~/.emacs.d/snippets" t)

(add-hook 'markdown-mode-hook 'yas-minor-mode-on)
(add-hook 'python-mode-hook 'yas-minor-mode-on)
(add-hook 'html-mode-hook 'yas-minor-mode-on)

(global-set-key (kbd "M-'") 'yas/expand)

(provide 'setup-yasnippet)
