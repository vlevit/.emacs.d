(require 'mediawiki)
(add-to-list 'auto-mode-alist '("\\.wiki$" . mediawiki-mode))
(add-hook 'mediawiki-mode-hook (lambda () (ispell-change-dictionary "english")))
(add-hook 'mediawiki-mode-hook 'flyspell-mode)

(provide 'my-wiki)