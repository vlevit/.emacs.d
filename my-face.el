(if (>= (x-display-pixel-width) 1920)
    (set-frame-font "DejaVu Sans Mono 13")
  (set-frame-font "DejaVu Sans Mono 10")
  (set-face-attribute 'default nil :height 105))

(provide 'my-face)
