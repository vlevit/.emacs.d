(require 'python)
(require 'fill-column-indicator)

;; http://puntoblogspot.blogspot.com/2013/03/poor-mans-taglist.html
(defun my-show-tags ()
  (interactive)
  (occur "^\\s-*\\\(class \\\|def \\\)")
  (with-current-buffer "*Occur*"
    (face-remap-add-relative 'match :background (face-background 'default))
    (rename-buffer "*Tag List*")))

(defun my-python-mode-hook ()
  (setq fill-column 79)
  (set (make-local-variable 'whitespace-style)
       (quote (face newline tabs newline-mark lines-tail)))
  (define-key python-mode-map (kbd "M-g M-t") 'my-show-tags)
  (define-key python-mode-map (kbd "M-n") 'python-nav-forward-statement)
  (define-key python-mode-map (kbd "M-p") 'python-nav-backward-statement)
  (define-key python-mode-map (kbd "M-e") 'python-nav-forward-sexp)
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

(require 'jedi)
(setq jedi:server-command (list "python2" jedi:server-script))

(defun my-jedi-server-setup ()
  (let ((ve-vlevit-org (expand-file-name "~/virtualenvs/vlevit.org/"))
        (vlevit-org-dir (expand-file-name "~/projects/vlevit.org/")))
    (let ((cmds (list "python2" jedi:server-script))
          (args (cond
                 ((string-prefix-p vlevit-org-dir (buffer-file-name))
                  (message "vlevit.org project!!!") (list "--virtual-env" ve-vlevit-org)))))
      (when cmds (set (make-local-variable 'jedi:server-command) cmds))
      (when args (set (make-local-variable 'jedi:server-args) args)))))


(add-hook 'python-mode-hook 'my-jedi-server-setup)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(provide 'my-python)
