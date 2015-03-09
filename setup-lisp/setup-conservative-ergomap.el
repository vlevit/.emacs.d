(defvar ergomap-keymap (make-sparse-keymap) "Ergomap keymap")

(define-key ergomap-keymap (kbd "<escape>") (kbd "C-g"))
(define-key ergomap-keymap (kbd "<f2>") 'save-buffer)
(define-key ergomap-keymap (kbd "<S-f2>") 'kill-this-buffer)

(define-key ergomap-keymap [remap kill-ring-save] 'kill-ring-save-line)

(define-key ergomap-keymap (kbd "M-2") 'other-window)
(define-key ergomap-keymap (kbd "M-@") '(lambda () (interactive) (other-window -1)))
(define-key ergomap-keymap (kbd "M-)") 'delete-other-windows)
(define-key ergomap-keymap (kbd "M-0") 'delete-window)
(define-key ergomap-keymap (kbd "M-3") 'split-window-horizontally-and-switch)
(define-key ergomap-keymap (kbd "M-#") 'split-window-vertically-and-switch)

(define-key ergomap-keymap (kbd "C-x C-a") 'ffap)

(define-key ergomap-keymap (kbd "M-H") 'mark-line)
(define-key ergomap-keymap (kbd "M-?") 'hippie-expand)
(define-key ergomap-keymap (kbd "<f5>") 'repeat)
(define-key ergomap-keymap (kbd "<C-f5>") 'repeat-complex-command)
(define-key ergomap-keymap (kbd "M-8") 'backward-sexp)
(define-key ergomap-keymap (kbd "M-9") 'forward-sexp)
(define-key ergomap-keymap (kbd "<C-f7>") 'next-error)
(define-key ergomap-keymap (kbd "<C-S-f7>") 'previous-error)
(define-key ergomap-keymap (kbd "<S-f10>") 'menu-bar-mode)

(define-key ergomap-keymap (kbd "M-<up>") 'move-text-up)
(define-key ergomap-keymap (kbd "M-<down>") 'move-text-down)

(require 'expand-region)
(define-key ergomap-keymap (kbd "M-6") 'er/expand-region)
(require 'multiple-cursors)
(define-key ergomap-keymap (kbd "M-7") 'mc/mark-next-like-this)
(define-key ergomap-keymap (kbd "M-5") 'mc/mark-all-like-this-dwim)

(define-key ergomap-keymap (kbd "M-g M-l") 'toggle-truncate-lines)

(require 'find-file-in-repository)
(define-key ergomap-keymap (kbd "C-x C-h") 'find-file-in-repository)

(define-minor-mode ergomap-mode
  "minor mode that provides ergonomic keybindings"
  nil
  nil                                   ;no mode line name
  ergomap-keymap)

(defun ergomap-mode-on () (ergomap-mode 1))

(define-globalized-minor-mode global-ergomap-mode ergomap-mode ergomap-mode-on)

(global-ergomap-mode)

(provide 'setup-conservative-ergomap)
