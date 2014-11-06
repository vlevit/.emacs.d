(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(add-to-list 'ac-modes 'latex-mode)
(add-to-list 'ac-modes 'plain-tex-mode)
(ac-config-default)

(setq ac-menu-height 20)
(setq ac-ignore-case nil)

; make ac work with flyspell(-prog)-mode
(ac-flyspell-workaround)

(provide 'setup-auto-complete)
