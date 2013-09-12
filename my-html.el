(defun my-html-mode-hook ()
  (auto-fill-mode -1)
  (setq sgml-basic-offset 4))

(add-hook 'html-mode-hook 'my-html-mode-hook)

(provide 'my-html)
