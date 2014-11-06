(setq site-lisp-dir (expand-file-name "site-lisp" user-emacs-directory))
(setq setup-lisp-dir (expand-file-name "setup-lisp" user-emacs-directory))

(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path setup-lisp-dir)

(require 'setup-globals)
(require 'setup-package)
(require 'setup-scroll)                    ; conservative scrolling
(require 'setup-whereami)                  ; setup-home and setup-at-work
(require 'setup-defuns)
(require 'setup-face)
(require 'setup-auto-compile)              ; compile setup-*el on save
(require 'setup-auto-zip)
(require 'setup-hippie-expand)
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

(require 'dired)
(require 'setup-conservative-ergomap)
(require 'setup-chord-keys)
(require 'setup-color-theme)
(require 'setup-vline)
(require 'pos-tip)
(require 'setup-marks)                     ; marker-visit, auto-mark
(require 'setup-smex)                      ; ido
(require 'setup-bm)
(require 'setup-clipboard)
(require 'setup-executable)
(require 'setup-saveplace)
(require 'setup-whitespace)                ; fill-column-indicator
(require 'setup-flymake)
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
(require 'setup-anything)
(require 'setup-visual-regexp)
(require 'setup-sunrise-commander)         ; ido
(require 'setup-elfeed)
(require 'setup-shell)                     ; shell-command, bash-completion
(require 'setup-multiple-async-shell-commands)
(require 'setup-fold-dwim)                 ; fold-dwim
(require 'setup-man)
(require 'setup-diff)
(require 'setup-sudo-edit)

(require 'setup-python)                    ; flymake, jedi
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

(add-hook 'after-init-hook 'auto-save-mode)

(setq custom-file (expand-file-name "setup-custom.el" setup-lisp-dir))
(load custom-file)
