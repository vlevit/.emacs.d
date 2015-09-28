;; (setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

(defvar my-visual-line-state nil)

(defun my-visual-line-mode-hook ()
  (when visual-line-mode
    (setq my-visual-line-state
          `(whitespace-style ,whitespace-style
            whitespace-mode ,whitespace-mode
            auto-fill-mode ,auto-fill-function))

    (when whitespace-mode
      whitespace-mode -1)

    ;; display newline characters with whitespace-mode
    (make-local-variable 'whitespace-style)
    (setq whitespace-style '(newline newline-mark))
    (whitespace-mode)

    ;; disable auto-fill-mode
    (when auto-fill-function
      (auto-fill-mode -1))

    ;; visually wrap text at fill-column
    (visual-fill-column-mode)))

(defun my-visual-line-mode-off ()
  (interactive)
  (visual-fill-column-mode--disable)
  (visual-line-mode -1)
  ;; revert the state before activating visual-line-mode
  (when my-visual-line-state
    (let ((ws-style (plist-get my-visual-line-state 'whitespace-style))
          (ws-mode (plist-get my-visual-line-state 'whitespace-mode))
          (af-mode (plist-get my-visual-line-state 'auto-fill-mode)))

      (when whitespace-mode
        (whitespace-mode -1))
      (when ws-style (setq whitespace-style ws-style))
      (when ws-mode (whitespace-mode 1))

      (when af-mode (auto-fill-mode 1)))))

(defun my-visual-line-mode-toggle ()
  (interactive)
  (if visual-line-mode
      (my-visual-line-mode-off)
    (visual-line-mode 1)))

(add-hook 'visual-line-mode-hook 'my-visual-line-mode-hook)

(provide 'setup-visual-line)
