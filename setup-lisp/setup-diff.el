(custom-set-faces
 '(diff-added ((t (:background "#DDFFDD" :inverse-video nil))) 'now)
 '(diff-removed ((t (:background "#FFDDDD" :inverse-video nil))) 'now)
 '(diff-header ((t (:background "#F8E9AE"))) 'now)
 '(diff-file-header ((t (:weight bold :background "#DDDDFF"))) 'now))

(add-hook 'diff-mode-hook 'diff-auto-refine-mode)

(provide 'setup-diff)
