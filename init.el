(setq site-lisp-dir (expand-file-name "site-lisp" user-emacs-directory))
(setq setup-lisp-dir (expand-file-name "setup-lisp" user-emacs-directory))

(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path setup-lisp-dir)

(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(require 'server)
(unless (server-running-p)
  (server-start))

(require 'setup-globals)
(require 'setup-private nil t)
(require 'setup-dir-locals)
(require 'setup-tls)
(require 'setup-package)
(require 'setup-scroll)                    ; beacon-mode
(require 'setup-whereami)                  ; setup-home and setup-at-*
(require 'setup-defuns)
(require 'setup-face)
(require 'setup-auto-compile)              ; compile setup-*el on save
(require 'setup-auto-zip)
(require 'setup-hippie-expand)
(require 'setup-grep)
(require 'setup-spell)
(require 'setup-lang)
(require 'setup-insert-date)
(require 'setup-tabs)
(require 'setup-c-x-x)
(require 'setup-duplicate-line)
(require 'setup-end-line-newline)
(require 'setup-mark-whole-line)
(require 'setup-transpose-symbols)
(require 'setup-uniquify-buffers)
(require 'find-file-in-project)
(require 'setup-find-file-in-repository)
(require 'setup-find-project)
(require 'setup-save-some-buffers)

(require 'dired)
(require 'setup-conservative-ergomap)
(require 'setup-chord-keys)
(require 'setup-color-theme)
(require 'setup-visual-line)
(require 'setup-vline)
(require 'pos-tip)
(require 'setup-marks)                     ; marker-visit, auto-mark
(require 'setup-smex)                      ; ido
(require 'setup-bm)
(require 'setup-clipboard)
(require 'setup-executable)
(require 'setup-saveplace)
(require 'setup-whitespace)                ; fill-column-indicator
(require 'setup-flycheck)
(require 'setup-auto-complete)
(require 'setup-dired)
(require 'setup-smartparens)
(require 'setup-yasnippet)
(require 'setup-multiple-cursors)
(require 'setup-occur-mode)
(require 'setup-buffer-stack)
(require 'setup-winner-mode)
(require 'ido-other-window)
(require 'setup-highlight-symbol)
(require 'setup-ido)                       ; recentf, imenu
(require 'setup-visual-regexp)
(unless (my-at-ironscales)
  (require 'setup-mu4e)
  (require 'setup-mu4e-maildir-extension)
  (require 'setup-mu4e-feeds))
(require 'setup-shell)                     ; shell-command, bash-completion
(require 'setup-multiple-async-shell-commands)
(require 'setup-man)
(require 'setup-diff)
(require 'setup-sudo-edit)
(require 'vlf)

(require 'setup-ansible)
(require 'setup-python)                    ; flymake, jedi
(require 'setup-elisp)
(require 'setup-c-mode)
(require 'setup-html)
(require 'setup-css)
(require 'setup-js)
(require 'setup-coffee)
(require 'setup-org-mode)
(require 'setup-markdown)
(require 'setup-wiki)
(require 'setup-tex)
(require 'setup-antiword)
(require 'setup-git)
(require 'setup-vlblog)
(require 'setup-twitter)

(setq buffer-file-name
      (expand-file-name (format-time-string "scratch/%Y%m%d%H%M%S") user-emacs-directory))
(add-hook 'after-init-hook 'auto-save-mode)

(setq custom-file (expand-file-name "setup-custom.el" setup-lisp-dir))
(load custom-file)

;; http://openwall.com/lists/oss-security/2017/09/11/1
;; Mitigate Bug#28350 (security) in Emacs 25.2 and earlier.
(eval-after-load "enriched"
  '(defun enriched-decode-display-prop (start end &optional param)
     (list start end)))
