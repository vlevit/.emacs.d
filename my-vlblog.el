(defvar blog-file-p nil)

(defun blog-file-p ()
  (string-prefix-p
   (expand-file-name "~/projects/vlevit.org/content/") (buffer-file-name)))

(defun vlblog-update ()
  "Run local server if it is not running and update the blog"
  (interactive)
  (if (/= (call-process "vlblog" nil nil nil "active") 0)
      (progn (async-shell-command "vlblog run" "*vlblog*")
             (with-current-buffer "*vlblog*" (setq truncate-lines t))
             (run-at-time "4 sec" nil '(lambda () (shell-command "vlblog update local"))))
    (shell-command "vlblog update local")))

(defun vlblog-view ()
  "Run local server if it is not running and update the blog"
  (interactive)
  (call-process "vlblog" nil nil nil
                "view" (buffer-file-name) (number-to-string (line-number-at-pos))))

(require 'magit)

(defun vlblog-staged-files ()
  (let ((diff-output (magit-git-string "diff" "--name-only" "--cached")))
    (when diff-output
      (split-string diff-output "\n"))))

(defun vlblog-commit-file ()
  (interactive)
  (let ((top-dir (magit-get-top-dir)))
        (if (not top-dir)
            (message "File is not in a git repo")
          (let ((staged-files (vlblog-staged-files)))
            (if (or (not staged-files)
                    (equal
                     (list (substring (buffer-file-name) (length top-dir)))
                     staged-files))
                (progn
                  (magit-run-git "add" (buffer-file-name))
                  (magit-log-edit-append
                   (format "Content: %s blog" (vblog-from-filename (buffer-file-name))))
                  (magit-log-edit))
              (message "There are some unstaged files"))))))

(defun vlblog-publish ()
  (interactive)
  (async-shell-command "vlblog publish" "*vlblog-publish*")
  (with-current-buffer "*vlblog-publish*" (setq truncate-lines t)))

(defun vlblog-update-on-save ()
  (when blog-file-p (vlblog-update)))

(add-hook 'after-save-hook 'vlblog-update-on-save)

(defun vblog-from-filename (filename)
  (string-match "/blog/.\\{2\\}/\\([0-9a-zA-Z-]+\\)/" filename)
  (match-string 1 filename))

(defun vlblog-hook ()
  (when (blog-file-p)
    (local-set-key (kbd "C-c C-u") 'vlblog-update)
    (local-set-key (kbd "C-c C-v") 'vlblog-view)
    (local-set-key (kbd "C-c C-m") 'vlblog-commit-file)
    (local-set-key (kbd "C-c C-l") 'vlblog-publish)))

(add-hook 'markdown-mode-hook 'vlblog-hook)

(dir-locals-set-class-variables
 'my-blog
 '((markdown-mode . ((blog-file-p . t)))))

(dir-locals-set-directory-class
 "~/projects/vlevit.org/content/" 'my-blog)

(provide 'my-vlblog)
