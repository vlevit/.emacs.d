(require 's)

(defvar blog-file-p nil)

(defun vlblog-parse-help-string (str)
  "Parse a single string STR from `vlblog help' output.
Return nil if STR is not a command.
Return a list of commands and options otherwise."
  (let ((matches (s-match "^vlblog \\(\\S +\\) ?\\(.+\\)*" str)))
    (if (<= (length matches) 2)
        (cdr matches)
      (cons (nth 1 matches) (s-split "|" (nth 2 matches) t)))))

(defun vlblog-commands ()
  "Run `vlblog help' an return a list of lists whose car is a
command and whose cdr is options."
  (delq nil (mapcar 'vlblog-parse-help-string
                    (mapcar 's-trim-left
                            (s-lines (shell-command-to-string "vlblog help"))))))

(defun vlblog ()
  "Run vlblog commands like in shell but with ido autocompletions."
  (interactive)
  (let* ((commands (vlblog-commands))
         (commands-flat (mapcar 'car commands))
         (command (ido-completing-read "vlblog " commands-flat))
         (options (cdr (assoc command commands)))
         (option nil))
    (when options
      (setq option (ido-completing-read (concat "vlblog " command " ") options)))
    (async-shell-command (s-join " " (list "vlblog" command option)))))

(defun blog-file-p ()
  (string-prefix-p
   (expand-file-name "~/projects/vlevit.org/content/") (buffer-file-name)))

(defun vlblog-update ()
  "Run a local server if it is not running yet and update the blog"
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

(provide 'setup-vlblog)
