(defun my-sgml-mode-hook ()
  (auto-fill-mode -1)
  (setq sgml-basic-offset 2)
  (setq truncate-lines t))

(add-hook 'sgml-mode-hook 'my-sgml-mode-hook)

(provide 'setup-html)
