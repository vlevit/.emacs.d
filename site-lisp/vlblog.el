(require 's)
(require 'magit)

(defvar vlblog-file-p nil)
(defvar vlblog-content-dir nil)
(defvar vlblog-log-message nil)

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
         (option nil)
         (buffer (if (equal command "start") "*vlblog-server*" "*vlblog*")))
    (when options
      (setq option (ido-completing-read (concat "vlblog " command " ") options)))
    (async-shell-command (s-join " " (list "vlblog" command option)) (get-buffer-create buffer))))

(defun vlblog-file-p ()
  (and vlblog-content-dir
       (string-prefix-p (expand-file-name vlblog-content-dir) (buffer-file-name))))

(defun vlblog-update ()
  "Run a local server if it is not running yet and update the blog"
  (interactive)
  (if (/= (call-process "vlblog" nil nil nil "active") 0)
      (progn (async-shell-command "vlblog start" "*vlblog-server*")
             (with-current-buffer "*vlblog-server*" (setq truncate-lines t))
             (run-at-time "4 sec" nil '(lambda () (shell-command "vlblog update local"))))
    (shell-command "vlblog update local")))

(defun vlblog-view ()
  "Run local server if it is not running and update the blog"
  (interactive)
  (call-process "vlblog" nil nil nil
                "view" (buffer-file-name) (number-to-string (line-number-at-pos))))

(defun vlblog-staged-files ()
  (let ((diff-output (magit-git-string "diff" "--name-only" "--cached")))
    (when diff-output
      (split-string diff-output "\n"))))

(defun vlblog-commit-file ()
  (interactive)
  (let ((top-dir (magit-get-top-dir)))
    (if (not top-dir)
        (message "File is not in a git repo")
      (if (buffer-modified-p)
          (message "Current buffer is modified. Save it first.")
        (let ((staged-files (vlblog-staged-files))
              (log-message (format "Content: %s blog" (vblog-from-filename (buffer-file-name)))))
          (if (and staged-files
                   (not (equal (list (substring (buffer-file-name) (length top-dir))) staged-files)))
              (message "There are some uncommited files")
            ;; update publish date
            (shell-command
             (concat "vlblog expand_published "
                     (string-join
                      (mapcar 'shell-quote-argument
                              (mapcar (lambda (f) (concat top-dir "/" f))
                                      staged-files)) " ")))
            (revert-buffer nil t)
            (magit-run-git "add" (buffer-file-name))
            (kill-new log-message)
            (setq vlblog-log-message log-message)
            (with-temp-buffer
              (cd top-dir)
              (magit-commit))))))))

(defun vlblog-log-insert-message ()
  (message "vlblog-log-insert-message")
  (message vlblog-log-message)
  (insert vlblog-log-message)
  (setq vlblog-log-message nil))

(add-hook 'git-commit-mode-hook 'vlblog-log-insert-message)

(defun vlblog-publish ()
  (interactive)
  (async-shell-command "vlblog publish" "*vlblog-publish*")
  (with-current-buffer "*vlblog-publish*" (setq truncate-lines t)))

(defun vlblog-update-on-save ()
  (when vlblog-file-p (vlblog-update)))

(add-hook 'after-save-hook 'vlblog-update-on-save)

(defun vblog-from-filename (filename)
  (string-match "/blog/.\\{2\\}/\\([0-9a-zA-Z-]+\\)/" filename)
  (match-string 1 filename))

(provide 'vlblog)
