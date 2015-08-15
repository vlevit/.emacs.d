(defun my-visual-line-mode-hook ()

  ;; display newline characters
  (make-local-variable 'whitespace-style)
  (when (and (boundp 'whitespace-mode) whitespace-mode)
    whitespace-mode -1)
  (setq whitespace-style '(newline newline-mark))
  (whitespace-mode)

  ;; disable auto-fill-mode
  (when (and (boundp 'auto-fill-mode) auto-fill-mode)
    (auto-fill-mode -1))

  ;; visually wrap text at fill-column
  (visual-fill-column-mode))


(add-hook 'visual-line-mode-hook 'my-visual-line-mode-hook)

(provide 'setup-visual-line)
