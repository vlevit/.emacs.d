(require 'typopunct)

(setq-default typopunct-buffer-language 'russian)
(defun turn-on-typopunct-mode ()
  (typopunct-mode t))
(add-hook 'markdown-mode-hook 'turn-on-typopunct-mode)
(add-hook 'org-mode-hook 'turn-on-typopunct-mode)

(provide 'setup-typopunct)
