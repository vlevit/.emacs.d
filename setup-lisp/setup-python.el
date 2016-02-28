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
  (fci-mode 1)
  ;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=21220
  (remove-hook 'python-mode-hook 'wisent-python-default-setup))
  ;; (my-highlight-indetation))

(add-hook 'python-mode-hook 'my-python-mode-hook)
(add-hook 'python-mode-hook 'flycheck-mode)

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
