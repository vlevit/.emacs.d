(custom-set-faces
 '(diff-added ((t (:background "#DDFFDD" :inverse-video nil :foreground "#657b83" :weight normal))))
 '(diff-file-header ((t (:weight bold :background "#DDDDFF"))))
 '(diff-header ((t (:background "#F8E9AE"))))
 '(diff-refine-change ((t (:foreground "#657b83" :weight normal))) t)
 '(diff-removed ((t (:background "#FFDDDD" :inverse-video nil :foreground "#657b83" :weight normal)))))

(add-hook 'diff-mode-hook 'diff-auto-refine-mode)

(provide 'setup-diff)
