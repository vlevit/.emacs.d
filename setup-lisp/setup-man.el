(setq Man-fontify-manpage-flag t)

(make-face 'my-man-overstrike)
(set-face-foreground 'my-man-overstrike "blue")
;; (set-face-bold-p 'my-man-overstrike t)
(setq Man-overstrike-face 'my-man-overstrike)

(make-face 'my-man-underline)
(set-face-foreground 'my-man-underline "green4")
(set-face-underline 'my-man-underline t)
(setq Man-underline-face 'my-man-underline)

(setq Man-width 70)
;; (setq Man-width nil)          ; Man-width equals currrent window width

(provide 'setup-man)
