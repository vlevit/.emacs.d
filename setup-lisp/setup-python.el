;;; Python mode setup

;; https://github.com/fgallina/python.el/pull/110
(defun python-font-lock-syntactic-face-function (state)
  (if (nth 3 state)
      (let ((startpos (nth 8 state)))
        (save-excursion
          (goto-char startpos)
          (if (and (looking-at-p "'''\\|\"\"\"")
                   (looking-back "\\`\\|^\\s *\\(?:class\\|def\\)\\s +\\(?:\\sw\\|\\s_\\)+(.*):\n\\s *"))
              font-lock-doc-face
            font-lock-string-face)))
    font-lock-comment-face))

;; https://github.com/fgallina/python.el/pull/82
;; (eval-after-load 'python
;;    '(font-lock-add-keywords 'python-mode `((,python-cell-cellbreak-regex
;;                                             1 'python-cell-cellbreak-face prepend))))

;; http://puntoblogspot.blogspot.com/2013/03/poor-mans-taglist.html
(defun my-show-tags ()
  (interactive)
  (occur "^\\s-*\\\(class \\\|def \\\)")
  (with-current-buffer "*Occur*"
    (face-remap-add-relative 'match :background (face-background 'default))
    (rename-buffer "*Tag List*")))

(defun my-python-mode-hook ()
  (set (make-local-variable 'font-lock-defaults)
       '(python-font-lock-keywords
         nil nil nil nil
         (font-lock-syntactic-face-function
          . python-font-lock-syntactic-face-function)))
  (setq fill-column 79)
  (define-key python-mode-map (kbd "M-g M-t") 'my-show-tags)
  (define-key python-mode-map (kbd "M-n") 'python-nav-forward-statement)
  (define-key python-mode-map (kbd "M-p") 'python-nav-backward-statement)
  (define-key python-mode-map (kbd "M-e") 'python-nav-forward-sexp)
  (define-key python-mode-map (kbd "C-c h") 'jedi:show-doc)
  (define-key python-mode-map (kbd "M-.") 'jedi:goto-definition)
  (define-key python-mode-map (kbd "M-,") 'jedi:goto-definition-pop-marker)
  (whitespace-mode 1)
  (fci-mode 1))
  ;; (my-highlight-indetation))

(add-hook 'python-mode-hook 'my-python-mode-hook)

(when (load "flymake" t)

  (defun my-flymake-save-buffer-in-file (file-name)
    ;; (make-directory (file-name-directory file-name) 1)
    (write-region nil nil file-name nil 566)
    (flymake-log 3 "saved buffer %s in file %s" (buffer-name) file-name))
  
  (defun my-flymake-init-create-temp-buffer-copy (create-temp-f)
  "Make a temporary copy of the current buffer, save its name in buffer data and return the name."
  (let*  ((source-file-name       buffer-file-name)
	  (temp-source-file-name  (funcall create-temp-f source-file-name "flymake")))

    (my-flymake-save-buffer-in-file temp-source-file-name)
    (setq flymake-temp-source-file-name temp-source-file-name)
    temp-source-file-name))
  
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (my-flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name 
                        temp-file
                        (file-name-directory buffer-file-name)))) 
      (list "pycheckers" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init))
  (add-to-list 'flymake-allowed-file-name-masks
               '("xatk" flymake-pyflakes-init)))

;;; Jedi setup

(defun my-jedi-server-setup ()

  (setq jedi:server-command (list "python2" jedi:server-script)
        jedi:complete-on-dot t)

  (let ((projects
         '(("~/projects/vlevit.org/" . "~/virtualenvs/vlevit.org/")
           ("~/work/josh/prettytracker/" . "~/virtualenvs/prettytracker/")
           ("~/work/josh/dash.cm/" . "~/virtualenvs/dash.cm/"))))
    (let ((cmds (list "python2" jedi:server-script))
          (args
           (let ((project-cons
                  (cl-find-if
                   '(lambda (project-cons)
                      (string-prefix-p (expand-file-name (car project-cons)) (buffer-file-name)))
                   projects)))
             (if project-cons
                 (list "--virtual-env" (expand-file-name (cdr project-cons)))))))
      (when cmds (set (make-local-variable 'jedi:server-command) cmds))
      (when args (set (make-local-variable 'jedi:server-args) args)))))


(add-hook 'python-mode-hook 'my-jedi-server-setup)
(add-hook 'python-mode-hook 'jedi:setup)

(provide 'setup-python)
