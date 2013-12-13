(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq flx-ido-threshhold 1000) ;; do not slowdown smex
;; disable ido faces to see flx highlights.
;; (setq ido-use-faces nil)

(setq ido-max-directory-size 100000) ;; 30 KB -- default

(setq ido-default-file-method 'selected-window
      ido-enable-flex-matching t
      ido-max-window-height 0.25        ; default
      ido-max-work-file-list 50
      ido-max-work-directory-list 50
      ;; ido-enter-matching-directory t    ; automatically complete directories
      ;; ido-auto-merge-delay-time 99999)
      ido-auto-merge-work-directories-length -1)

(setq ido-ignore-buffers
      '("\\` "
        "^\\*Completions\\*"
        "^\\*Quail Completions\\*"
        "^\\*Ido Completions\\*"
        "^\\*Compile-Log\\*"
        "^\\*tramp"
        "^.*(Sunrise)"))

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))


(require 'imenu)

;; http://zahardzhan.github.io/2010/emacs-starter-kit-the-program.html
(defun ido-imenu ()
  "Update the imenu index and then use ido to select a symbol to navigate to.
   Symbols matching the text at point are put first in the completion list."
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
        (symbol-names '()))
    (flet ((addsymbols (symbol-list)
                       (when (listp symbol-list)
                         (dolist (symbol symbol-list)
                           (let ((name nil) (position nil))
                             (cond
                              ((and (listp symbol) (imenu--subalist-p symbol))
                               (addsymbols symbol))

                              ((listp symbol)
                               (setq name (car symbol))
                               (setq position (cdr symbol)))

                              ((stringp symbol)
                               (setq name symbol)
                               (setq position (get-text-property 1 'org-imenu-marker symbol))))

                             (unless (or (null position) (null name))
                               (add-to-list 'symbol-names name)
                               (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    ;; If there are matching symbols at point, put them at the beginning of `symbol-names'.
    (let ((symbol-at-point (thing-at-point 'symbol)))
      (when symbol-at-point
        (let* ((regexp (concat (regexp-quote symbol-at-point) "$"))
               (matching-symbols (delq nil (mapcar (lambda (symbol)
                                                     (if (string-match regexp symbol) symbol))
                                                   symbol-names))))
          (when matching-symbols
            (sort matching-symbols (lambda (a b) (> (length a) (length b))))
            (mapc (lambda (symbol) (setq symbol-names (cons symbol (delete symbol symbol-names))))
                  matching-symbols)))))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
           (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))


(setq enable-recursive-minibuffers t)
(defun ido-goto-bookmark (bookmark)
  (interactive
   (list (bookmark-completing-read "Jump to bookmark"
                       bookmark-current-bookmark)))
  (unless bookmark
    (error "No bookmark specified"))
  (let ((filename (bookmark-get-filename bookmark)))
    (ido-set-current-directory
     (if (file-directory-p filename)
     filename
       (file-name-directory filename)))
    (setq ido-exit        'refresh
      ido-text-init   ido-text
      ido-rotate-temp t)
    (exit-minibuffer)))

;; (define-key ido-file-dir-completion-map (kbd "M-@") 'ido-goto-bookmark)
;; (global-set-key (kbd "M-@") 'ido-goto-bookmark)

;; Display ido results vertically, rather than horizontally
;; http://emacswiki.org/emacs/InteractivelyDoThings#toc20

(setq ido-decorations (quote (" " "" "\n              " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)

(defun ido-go-home ()
  (interactive)
  (ido-set-current-home)
  (setq ido-exit 'refresh
        ido-text-init ido-text
        ido-rotate-temp t)
  (exit-minibuffer))

(defun ido-go-root ()
  (interactive)
  (ido-set-current-directory "/")
  (setq ido-exit 'refresh
        ido-text-init ido-text
        ido-rotate-temp t)
  (exit-minibuffer))

(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
  (define-key ido-file-completion-map (kbd "~") 'ido-go-home)
  (define-key ido-file-completion-map (kbd "/") 'ido-go-root))

(add-hook 'ido-setup-hook 'ido-define-keys)

(global-set-key (kbd "M-`") 'ido-switch-buffer)
(global-set-key (kbd "C-`") 'ido-switch-buffer)
(global-set-key (kbd "M-~") 'recentf-ido-find-file)

(global-set-key (kbd "M-g M-h") 'ido-imenu)

(provide 'my-ido)
