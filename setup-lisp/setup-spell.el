(require 'auto-dictionary)

;; (setq ispell-program-name "aspell")

;; (add-to-list 'ispell-local-dictionary-alist
;;              '("ru-yeyo" "[а-яА-Яё]" "[^а-яА-Яё]" "" t ("-d" "ru-yeyo") nil utf-8))

(setq flyspell-large-region 1000)

(defun my-flyspell-mode-hook ()
  (unless (derived-mode-p 'sgml-mode)
    ; flyspell hangs in mu4e-compose for some reason
    (flyspell-mode 1)
    (auto-dictionary-mode 1)))

(defun my-flyspell-prog-mode-hook ()
  (ispell-change-dictionary "english" nil)
  (flyspell-prog-mode))

(add-hook 'text-mode-hook 'my-flyspell-mode-hook)

(add-hook 'prog-mode-hook 'my-flyspell-prog-mode-hook)
(add-hook 'sgml-mode-hook 'my-flyspell-prog-mode-hook)

;; http://sen-emacs-conf.googlecode.com/svn-history/r5/trunk/sen-defuns.el

(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))

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

(provide 'setup-spell)
