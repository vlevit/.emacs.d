(require 'fill-column-indicator)

(setq whitespace-style '(face trailing tabs))

(setq whitespace-display-mappings
      '((space-mark 32 [183])            ; normal space
        (newline-mark 10 [?↷ 10])))      ; newline

(setq whitespace-line-column 79)

(eval-after-load 'whitespace
  (lambda ()
    (set-face-attribute 'whitespace-newline nil :foreground "#d3d7cf")
    (set-face-attribute 'whitespace-tab nil :background nil :underline "#d3d7cf")
    (set-face-attribute 'whitespace-trailing nil :background nil :underline "#a40000")))

(defun whitespace-post-command-hook() nil) ; workaround for cursor slowdown

(add-hook 'prog-mode-hook 'whitespace-mode)

(provide 'setup-whitespace)
