(custom-set-faces
 '(diff-added ((t (:background "#DDFFDD"))) 'now)
 '(diff-removed ((t (:background "#FFDDDD"))) 'now)
 '(diff-header ((t (:background "#F8E9AE"))) 'now)
 '(diff-file-header ((t (:weight bold :background "#DDDDFF"))) 'now))

(add-hook 'diff-mode-hook 'diff-auto-refine-mode)

(provide 'my-diff)