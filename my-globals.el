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
(setq comment-style 'multi-line)
(recentf-mode 1)                              ; recent files
(setq recentf-max-saved-items 100)            ; save last 100 recent files
(setq recentf-keep '(file-remote-p file-readable-p))
; (setq x-meta-keysym 'alt)
; (setq x-alt-keysym 'meta)
(setq sentence-end-double-space nil)
(setq split-width-threshold 120)
(setq-default require-final-newline t)
(setq delete-by-moving-to-trash t)
(setq disabled-command-function nil)    ; enable all disabled commands
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(provide 'my-globals)