(require 'sunrise-commander)
(require 'sunrise-x-loop)
(require 'sunrise-x-tabs)

(global-set-key (kbd "C-x C-d") 'sunrise-cd)
(global-set-key (kbd "C-x d") 'sunrise)

(setq find-directory-functions (cons 'sr-dired find-directory-functions))

(define-key sr-mode-map (kbd "i") 'dired-previous-line)
(define-key sr-mode-map (kbd "k") 'dired-next-line )
;; (define-key sr-mode-map (kbd "I") (lambda () (dired-previous-line 7)))
;; (define-key sr-mode-map (kbd "K") (lambda () (dired-next-line 7)))
(define-key sr-mode-map (kbd "I") (kbd "C-M-7 i"))
(define-key sr-mode-map (kbd "K") (kbd "C-M-7 k"))

(define-key sr-mode-map (kbd "l") 'sr-advertised-find-file)
(define-key sr-mode-map (kbd "j") 'sr-dired-prev-subdir)

(define-key sr-mode-map (kbd "J") 'sr-history-prev)
(define-key sr-mode-map (kbd "L") 'sr-history-next)

(define-key sr-mode-map (kbd "2") 'sr-editable-pane)

(define-key sr-mode-map (kbd "M-7") 'sr-history-prev)
(define-key sr-mode-map (kbd "M-9") 'sr-history-next)
(define-key sr-mode-map (kbd "a") 'sr-sticky-isearch-forward)
(define-key sr-mode-map (kbd "<backspace>") 'sr-dired-prev-subdir)
(define-key sr-mode-map (kbd "/") 'sr-fuzzy-narrow)

(define-key sr-mode-map (kbd "1") 'sr-goto-dir)
(define-key sr-mode-map (kbd "3") 'sr-quick-view)
(define-key sr-mode-map (kbd "4") 'sr-advertised-find-file)
(define-key sr-mode-map (kbd "5") 'sr-do-copy)
(define-key sr-mode-map (kbd "6") 'sr-do-rename)
(define-key sr-mode-map (kbd "7") 'dired-create-directory)
(define-key sr-mode-map (kbd "8") 'sr-do-delete)
;; (define-key sr-mode-map (kbd "9") 'sr-sticky-isearch-forward)
;; (define-key sr-mode-map (kbd "0") 'sr-quit)

(define-key sr-mode-map (kbd "o") 'ido-find-file)
(define-key sr-mode-map (kbd ";") 'dired-isearch-filenames)
(define-key sr-mode-map (kbd "h") 'sr-sticky-isearch-forward)

(defun my-sr-find-file ()
  (interactive)
  (ido-find-file)
  (when (buffer-file-name)
    (setq sr-running nil)
    (delete-other-windows)
    (setq sr-current-frame nil)))  

(define-key sr-mode-map [remap ido-find-file] 'my-sr-find-file)

;; Bookmarks

(defvar my-ido-bm-map (make-sparse-keymap))
(defvar my-sr-bm-map (make-sparse-keymap))

(defmacro my-bm (keys dir)
  (list 'progn
    `(define-key my-ido-bm-map ,keys
       (lambda ()
         (interactive)
         (ido-set-current-directory ,dir)
         (setq ido-exit 'refresh
               ido-text-init ido-text
               ido-rotate-temp t)
         (exit-minibuffer)))
    `(define-key my-sr-bm-map ,keys
       (lambda () (interactive) (sr-goto-dir ,dir)))))

(if (or (my-home) (my-book))
    (progn
      (my-bm (kbd "p") "/tmp")
      (my-bm (kbd "P") "/var/tmp")
      (my-bm (kbd "m") "~/Music")
      (my-bm (kbd "v") "~/Video")
      (my-bm (kbd "j") "~/projects")
      (my-bm (kbd "w") "~/work")
      (my-bm (kbd "~") "~")
      (my-bm (kbd "h") "~")
      (my-bm (kbd "d") "~/Docs")
      (my-bm (kbd "t") "~/Text")
      (my-bm (kbd "e") "/media")
      (my-bm (kbd "i") "/run/media/vlevit/")
      (my-bm (kbd "a") "/media/MAXTORUNCLE")
      (my-bm (kbd "z") "/media/zbox")))

(defun my-ido-bm-keys ()
  "Add bookmark keybindings for ido."
  (define-key ido-file-dir-completion-map "`" my-ido-bm-map))
(add-hook 'ido-setup-hook 'my-ido-bm-keys)

(define-key sr-mode-map "`" my-sr-bm-map)


(global-set-key (kbd "C-S-o") 'sunrise-cd)
(provide 'setup-sunrise-commander)
