(require 'vlblog)

(setq vlblog-content-dir "~/projects/vlevit.org/content/")

(dir-locals-set-class-variables
 'my-blog
 '((markdown-mode . ((vlblog-file-p . t)))))

(dir-locals-set-directory-class vlblog-content-dir 'my-blog)

(defun vlblog-hook ()
  (when (vlblog-file-p)
    (local-set-key (kbd "C-c C-u") 'vlblog-update)
    (local-set-key (kbd "C-c C-v") 'vlblog-view)
    (local-set-key (kbd "C-c C-m") 'vlblog-commit-file)
    (local-set-key (kbd "C-c C-l") 'vlblog-publish)))

(add-hook 'markdown-mode-hook 'vlblog-hook)

(provide 'setup-vlblog)
