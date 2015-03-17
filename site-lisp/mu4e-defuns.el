(defun mu4e-mark-as-read()
  (interactive)
  (let* ((msg (mu4e-message-at-point))
         (docid (mu4e-message-field msg :docid))
         (markdesc (cdr (assq 'read mu4e-marks)))
         (action (plist-get markdesc :action)))
    (funcall action docid nil)
    (mu4e-headers-next)))

(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (ido-completing-read "Compose with account:"
                                 (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                                 nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

(defun mu4e-view-plaintext ()
  (interactive)
  (defun mu4e-set-local-variables()
    (set (make-local-variable 'mu4e-view-prefer-html) nil)
    (set (make-local-variable 'mu4e-view-html-plaintext-ratio-heuristic) 1e6))
  (mu4e-set-local-variables)
  (mu4e-view-refresh)
  ;; set local variables again since they are reset after refresh
  (mu4e-set-local-variables))

(defun mu4e-view-html ()
  (interactive)
  (set (make-local-variable 'mu4e-view-prefer-html) t)
  (mu4e-view-refresh)
  (set (make-local-variable 'mu4e-view-prefer-html) t))

(defun mu4e-view-plaintext-p (msg)
  (let ((txt (mu4e-message-field msg :body-txt))
        (html (mu4e-message-field msg :body-html)))
    (and (> (* mu4e-view-html-plaintext-ratio-heuristic
               (length txt)) (length html))
		 ;; use html if it's prefered, unless there is no html
		 (or (not mu4e-view-prefer-html) (not html)))))

(defun mu4e-view-toggle-plaintext ()
  (interactive)
  (if (mu4e-view-plaintext-p mu4e~view-msg)
      (mu4e-view-html)
    (mu4e-view-plaintext)))

(provide 'mu4e-defuns)
