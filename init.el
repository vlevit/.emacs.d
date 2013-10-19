(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/src")

(tool-bar-mode -1)                   ; turn off toolbar
(scroll-bar-mode -1)                 ; turn off scrollbar
(menu-bar-mode -1)                   ; turn off menubar
(server-mode 1)                      ; now emacsclient runs server

;; (setq debug-on-error t)                 ; enable backtrace on start
;; (desktop-save-mode 1)                ; save desktop across sessions
(setq x-select-enable-clipboard t)   ; make emacs yank work with clipboard
(savehist-mode 1)                    ; save mini-buffer history across sessions
(setq history-length 100)            ; max length of all history lists
(setq initial-scratch-message nil)   ; no message in *scratch*
(setq inhibit-startup-message t)     ; disable startup message 
(setq inhibit-splash-screen t)       ; disable splash screen
(transient-mark-mode 1)              ; highlight text selection
(delete-selection-mode 1)            ; delete seleted text when typing
(show-paren-mode 1)                  ; turn on paren match highlighting
(global-linum-mode 1)     ; display of line numbers in the left margin
(line-number-mode 1)      ; make line number appear in the mode line
(column-number-mode 1)    ; make column number appear in the mode line
(cua-selection-mode 1)    ; shifted movement keys activate the region
; (set-default-font "DejaVu Sans Mono")         ; set default font to DejaVu Sans Mono
(setq word-wrap t)
(setq fill-column 70)
(set-face-attribute 'default nil :height 105) ; set font size to 10.5pt
(setq comment-style 'multi-line)
(recentf-mode 1)                              ; recent files
(setq recentf-max-saved-items 100)            ; save last 100 recent files
(setq recentf-keep '(file-remote-p file-readable-p))
; (setq x-meta-keysym 'alt)
; (setq x-alt-keysym 'meta)
(setq sentence-end-double-space nil)
(setq split-width-threshold 120)

(require 'my-whereami)                  ; my-home and my-at-work
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
(require 'my-sunrise-commander)         ; ido
(require 'my-shell)                     ; shell-command, bash-completion
(require 'my-multiple-async-shell-commands)
(require 'my-fold-dwim)                 ; fold-dwim
(require 'my-man)
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

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq delete-by-moving-to-trash t)

;; (set-face-foreground 'whitespace-line "blue")
(put 'dired-find-alternate-file 'disabled nil)
(put 'autopair-newline 'disabled nil)
(setq custom-file "~/.emacs.d/my-custom.el")
(load custom-file)
;; (org-agenda-list)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
