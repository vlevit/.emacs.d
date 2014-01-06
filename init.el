(add-to-list 'load-path "~/.emacs.d")

(require 'my-globals)
(require 'my-scroll)                    ; conservative scrolling
(require 'my-whereami)                  ; my-home and my-at-work
(require 'my-face)
(require 'my-auto-compile)              ; compile my-*el on save
(require 'my-package)
(require 'my-hippie-expand)
(require 'my-spell)
(require 'bookmark+)
(require 'my-lang)
(require 'my-insert-date)
(require 'my-tabs)
(require 'my-c-x-x)
(require 'my-duplicate-line)
(require 'my-end-line-newline)
(require 'my-mark-whole-line)
(require 'my-transpose-symbols)

(require 'my-conservative-ergomap)
(require 'my-chord-keys)
(require 'my-color-theme)
(require 'my-vline)
(require 'pos-tip)
(require 'my-marks)                     ; marker-visit, auto-mark
(require 'my-smex)                      ; ido
(require 'my-bm)
(require 'my-clipboard)
(require 'my-executable)
(require 'my-saveplace)
(require 'my-whitespace)                ; fill-column-indicator
(require 'my-flymake)
(require 'my-auto-complete)
(require 'my-dired)
(require 'my-smartparens)
(require 'my-yasnippet)
(require 'my-multiple-cursors)
(require 'my-occur-mode)
(require 'my-buffer-stack)
(require 'my-winner-mode)
(require 'ido-other-window)
(require 'my-highlight-symbol)
(require 'my-ido)                       ; recentf, imenu
(require 'my-anything)
(require 'my-visual-regexp)
(require 'my-sunrise-commander)         ; ido
(require 'my-shell)                     ; shell-command, bash-completion
(require 'my-multiple-async-shell-commands)
(require 'my-fold-dwim)                 ; fold-dwim
(require 'my-man)
(require 'my-diff)
(require 'my-sudo-edit)

(require 'my-python)                    ; flymake, jedi
(require 'my-c-mode)
(require 'my-html)
(require 'my-css)
(require 'my-js)
(require 'my-org-mode)
(require 'my-markdown)
(require 'my-wiki)
(require 'my-bbcode)
(require 'my-tex)
(require 'my-antiword)
(require 'my-git)
(require 'my-vlblog)
(require 'my-util)

(setq custom-file "~/.emacs.d/my-custom.el")
(load custom-file)
