(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(add-to-list 'ac-modes 'latex-mode)
(add-to-list 'ac-modes 'plain-tex-mode)
(ac-config-default)

(setq ac-menu-height 20
      ac-ignore-case nil
      ac-delay 0.25
      ac-auto-show-menu 2.0)

; make ac work with flyspell(-prog)-mode
(ac-flyspell-workaround)

(provide 'setup-auto-complete)
