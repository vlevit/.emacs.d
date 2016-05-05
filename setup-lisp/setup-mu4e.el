(require 'mu4e)
(require 'mu4e-contrib)
(require 'mu4e-defuns)

;; email obfuscation
(defun @vlevit (address) (concat address "@vlevit.org"))
(defun @gmail (address) (concat address "@gmail.com"))

(setq mu4e-maildir "~/Maildir"
      mu4e-attachment-dir "~/Attachments"
      mu4e-change-filenames-when-moving t
      mu4e-headers-show-threads nil
      mu4e-headers-results-limit 50
      mu4e-view-html-plaintext-ratio-heuristic 10
      mu4e-view-show-addresses t
      mu4e-view-show-images t
      mu4e-html2text-command 'mu4e-shr2text
      mu4e-msg2pdf "/usr/bin/msg2pdf"
      mu4e-compose-signature "Sent with mu4e -> message-mode -> emacs -> msmtp -> postfix"
      mu4e-compose-signature-auto-include nil
      mu4e-compose-dont-reply-to-self t
      mail-user-agent 'mu4e-user-agent)

(setq mu4e-sent-folder "/me/Sent"
      mu4e-trash-folder "/me/Trash"
      mu4e-drafts-folder "/me/Drafts"
      user-mail-address (@vlevit "me")
      user-full-name "Vyacheslav Levit")

;; http://www.djcbsoftware.nl/code/mu/mu4e/Multiple-accounts.html
(defvar my-mu4e-account-alist
  `(("me"
     (mu4e-sent-folder "/me/Sent")
     (mu4e-trash-folder "/me/Trash")
     (mu4e-drafts-folder "/me/Drafts")
     (user-mail-address ,(@vlevit "me"))
     (user-full-name "Vyacheslav Levit"))
    ("levit.slava"
     (mu4e-sent-folder "/levit.slava/Sent")
     (mu4e-trash-folder "/levit.slava/Trash")
     (mu4e-drafts-folder "/levit.slava/Drafts")
     (user-mail-address ,(@gmail "levit.slava"))
     (user-full-name "Vyacheslav Levit"))
    ("alex.dyadya"
     (mu4e-sent-folder "/alex.dyadya/Sent")
     (mu4e-trash-folder "/alex.dyadya/Trash")
     (mu4e-drafts-folder "/alex.dyadya/Drafts")
     (user-mail-address ,(@gmail "alex.dyadya"))
     (user-full-name "Alex Dyadya"))
    ("spnest"
     (mu4e-sent-folder "/spnest/Sent")
     (mu4e-trash-folder "/spnest/Trash")
     (mu4e-drafts-folder "/spnest/Drafts")
     (user-mail-address ,(@gmail "spnest"))
     (user-full-name "Slava"))))

(setq mu4e-user-mail-address-list
      `(,(@vlevit "me")
        ,(@vlevit "dev")
        ,(@vlevit "admin")
        ,(@vlevit "postmaster")
        ,(@vlevit "work")
        ,(@vlevit "bulk")
        ,(@vlevit "red")
        ,(@gmail "levit.slava")
        ,(@gmail "alex.dyadya")))

(setq mu4e-maildir-shortcuts
      '(("/me/Inbox" . ?i)
        ("/me/Personal" . ?p)
        ("/local" . ?c)
        ("/me/Admin" . ?a)
        ("/me/Dev" . ?d)
        ("/me/Work" . ?w)
        ("/me/Bulk" . ?b)
        ("/me/Junk" . ?j)
        ("/me/Trash" . ?t)
        ("/me/Sent" . ?s)
        ("/alex.dyadya/Inbox" . ?l)
        ("/spnest/Inbox" . ?n)
        ("/feeds/personal" . ?f)))

(setq mu4e-bookmarks
      '(("flag:unread AND NOT flag:trashed AND NOT maildir:/feeds/*" "Unread messages" ?u)
        ("date:today..now" "Today's messages" ?t)
        ("maildir:/me/* AND NOT maildir:/me/Sent AND NOT maildir:/me/Trash" "me" ?i)
        ("flag:unread AND maildir:/feeds/*" "Feeds" ?f)
        ("maildir:/feeds/*" "Feeds" ?F)
        ("date:7d..now AND NOT maildir:/feeds/" "Last 7 days" ?w)))

(add-to-list 'mu4e-view-actions
  '("ViewInBrowser" . mu4e-action-view-in-browser) t)

(setq message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "/usr/bin/msmtp"
      ;; message-sendmail-f-is-evil t      ; don't add --from
      ;; message-sendmail-extra-arguments (list "--read-envelope-from")
      message-sendmail-envelope-from 'header)

(add-hook 'mu4e-compose-pre-hook
  (defun my-set-from-address ()
    "Set the From address based on the To address of the original."
    (let ((msg mu4e-compose-parent-message)) ;; msg is shorter...
      (when (and msg (mu4e-message-contact-field-matches msg :to (@vlevit ".*")))
        (let ((addr (cdr (car (mu4e-message-field msg :to)))))
          (setq user-mail-address addr))))))

(add-hook 'mu4e-compose-mode-hook
  (defun my-mu4e-visual-line-reply ()
    "Activate visual-line-mode for specific services like GitHub."
    (let ((msg mu4e-compose-parent-message))
      (when (and msg (mu4e-message-contact-field-matches
                      msg :from '(".*@github.com$" ".*@upwork.com$")))
        (visual-line-mode)))))

;; source: http://zmalltalker.com/linux/mu.html#sec-1-2-1
(defun choose-msmtp-account ()
  (if (message-mail-p)
      (save-excursion
        (let*
            ((from (save-restriction
                     (message-narrow-to-headers)
                     (message-fetch-field "from")))
             (account
              (cond
               ((string-match (@vlevit ".*") from) (@vlevit "me"))
               ((string-match (@gmail "spnest.*") from) (@gmail "spnest"))
               ((string-match (@gmail "levit.slava.*") from) (@gmail "levit.slava"))
               ((string-match (@gmail "alex.dyadya") from) (@gmail "alex.dyadya")))))
          (setq message-sendmail-extra-arguments (list '"-a" account))))))

(defun my-mu4e-update-handler (msg is-move)
  (unless is-move
    (let ((flags (mu4e-message-field msg :flags))
          (msgid (mu4e-message-field msg :message-id))
          (maildir (mu4e-message-field msg :maildir)))
      (when (member 'seen flags)
        (message msgid)
        (unless (string-prefix-p "/feeds/" maildir)
          (start-process "checkmail" nil "checkmail" "--update"))))))

(advice-add 'mu4e~headers-update-handler :before 'my-mu4e-update-handler)

(define-key mu4e-headers-mode-map "r" 'mu4e-mark-as-read)
(define-key mu4e-headers-mode-map "e" 'mu4e-headers-search-edit)
(define-key mu4e-main-mode-map "q" 'bury-buffer)
(define-key mu4e-view-mode-map "l" 'mu4e-view-toggle-plaintext)
(define-key mu4e-view-mode-map (kbd "<tab>") 'shr-next-link)
(define-key mu4e-view-mode-map "f" 'mu4e-shr-browse-last-url)

(add-hook 'message-send-mail-hook 'choose-msmtp-account)
(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)
;; (add-hook 'mu4e-view-mode-hook 'visual-line-mode)
(add-hook 'mu4e-view-mode-hook (lambda () (setq fill-column 80)))

(provide 'setup-mu4e)
