(defun my-set-dynamic-face ()
  (interactive)
  (if (>= (x-display-pixel-width) 1920)
      (set-frame-font "DejaVu Sans Mono 11")
    (set-frame-font "DejaVu Sans Mono 10")
    (set-face-attribute 'default nil :height 105)))

(my-set-dynamic-face)

(provide 'setup-face)
