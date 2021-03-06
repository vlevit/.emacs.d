(setq site-lisp-dir (expand-file-name "site-lisp" user-emacs-directory))
(add-to-list 'load-path site-lisp-dir)

(tool-bar-mode -1)                   ; turn off toolbar
(scroll-bar-mode -1)                 ; turn off scrollbar
(menu-bar-mode -1)                   ; turn off menubar
;; hide Emacs title bar on X11
(shell-command "xid=$(wmctrl -xl| awk '$3 == \"emacs.Emacs\" {print $1}' | tail -n 1); xprop -id ${xid} -f _MOTIF_WM_HINTS 32c -set _MOTIF_WM_HINTS \"0x2, 0x0, 0x0, 0x0, 0x0\"; wmctrl -i -a $xid")

(setq visible-bell t)
(set-default 'indicate-empty-lines t)
;; (setq debug-on-error t)                 ; enable backtrace on start
;; (desktop-save-mode 1)                ; save desktop across sessions
(setq x-select-enable-clipboard t)   ; make emacs yank work with clipboard
(savehist-mode 1)                    ; save mini-buffer history across sessions
(setq history-length 100)            ; max length of all history lists
(setq initial-scratch-message nil)   ; no message in *scratch*
(setq inhibit-startup-message t      ; disable startup message
      inhibit-splash-screen t)       ; disable splash screen
(transient-mark-mode 1)              ; highlight text selection
(show-paren-mode 1)                  ; turn on paren match highlighting
(line-number-mode 1)      ; make line number appear in the mode line
(column-number-mode 1)    ; make column number appear in the mode line
(cua-selection-mode 1)
(delete-selection-mode 1)
; (set-default-font "DejaVu Sans Mono")         ; set default font to DejaVu Sans Mono
(setq word-wrap t
      fill-column 70
      comment-style 'multi-line)
(recentf-mode 1)                              ; recent files
(setq recentf-max-saved-items 200             ; save last 200 recent files
      recentf-exclude '(file-remote-p "/media/"))
; (setq x-meta-keysym 'alt)
; (setq x-alt-keysym 'meta)
(setq sentence-end-double-space nil)
(setq split-width-threshold 120)
(setq-default require-final-newline t)
(setq delete-by-moving-to-trash t)
(setq disabled-command-function nil)    ; enable all disabled commands
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(electric-indent-mode -1)

(provide 'setup-globals)
