(require 'ispell)
(require 'flyspell)

(setq ispell-program-name "aspell")

(add-to-list 'ispell-local-dictionary-alist
             '("ru-yeyo" "[а-яА-Яё]" "[^а-яА-Яё]" "" t ("-d" "ru-yeyo") nil utf-8))

(defun my-flyspell-mode-hook ()
  (unless (eq major-mode 'html-mode)
    (flyspell-mode 1)
    (ispell-change-dictionary "ru-yeyo")
    (flyspell-buffer)))

(defun my-flyspell-prog-mode-hook ()
  (flyspell-prog-mode)
  (ispell-change-dictionary "english" nil))

(add-hook 'text-mode-hook 'my-flyspell-mode-hook)
(add-hook 'rst-mode-hook 'my-flyspell-mode-hook)
(add-hook 'markdown-mode-hook 'my-flyspell-mode-hook)

(add-hook 'prog-mode-hook 'my-flyspell-prog-mode-hook)
(add-hook 'html-mode-hook 'my-flyspell-prog-mode-hook)

;; http://sen-emacs-conf.googlecode.com/svn-history/r5/trunk/sen-defuns.el

(defun ispell-previous-error(arg)
  "Go to the arg previous spelling error in the buffer and use ispell
to correct the word"
  (interactive "p")
  (save-excursion
    (flyspell-goto-previous-error arg)
    (ispell-word)))


(defun flyspell-goto-previous-error (arg)
  "Go to arg previous spelling error."
  (interactive "p")
  (while (not (= 0 arg))
    (let ((pos (point))
          (min (point-min)))
      (if (and (eq (current-buffer) flyspell-old-buffer-error)
               (eq pos flyspell-old-pos-error))
          (progn
            (if (= flyspell-old-pos-error min)
                ;; goto beginning of buffer
                (progn
                  (message "Restarting from end of buffer")
                  (goto-char (point-max)))
              (backward-word 1))
            (setq pos (point))))
      ;; seek the next error
      (while (and (> pos min)
                  (let ((ovs (overlays-at pos))
                        (r '()))
                    (while (and (not r) (consp ovs))
                      (if (flyspell-overlay-p (car ovs))
                          (setq r t)
                        (setq ovs (cdr ovs))))
                    (not r)))
        (backward-word 1)
        (setq pos (point)))
      ;; save the current location for next invocation
      (setq arg (1- arg))
      (setq flyspell-old-pos-error pos)
      (setq flyspell-old-buffer-error (current-buffer))
      (goto-char pos)
      (if (= pos min)
          (progn
            (message "No more miss-spelled word!")
            (setq arg 0))))))

(define-key flyspell-mode-map (kbd "<C-f8>") 'flyspell-goto-next-error)
(define-key flyspell-mode-map (kbd "<C-S-f8>") 'flyspell-goto-previous-error)

(provide 'my-spell)
