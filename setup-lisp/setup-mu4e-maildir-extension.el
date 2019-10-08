(require 'mu4e-maildirs-extension)

(setq mu4e-maildirs-extension-hide-empty-maildirs nil)


;; (setq mu4e-maildirs-extension-custom-list nil)
(setq mu4e-maildirs-extension-custom-list
      '("/me/Inbox"
        "/me/Personal"
        "/me/Admin"
        "/me/Dev"
        "/me/Work"
        "/me/Work/.Admin"
        "/me/Work/.Management"
        "/me/Bulk"
        "/me/Junk"
        "/me/Trash"
        "/me/SMS"
        "/me/Sent"

        "/ironscales/*"
        "/ironscales/Inbox"
        ;; "/ironscales/Alerts/*"
        "/ironscales/Alerts/.AWS"
        "/ironscales/Alerts/.DataDog"
        "/ironscales/Alerts/.Sentry"
        "/ironscales/Alerts/.Queues"
        "/ironscales/Alerts/.Federation"
        "/ironscales/Alerts/.Malicious"
        "/ironscales/Alerts/.Mitigations"
        "/ironscales/Alerts/.Attacks"
        "/ironscales/Sent Items"

        "/alex.dyadya/Inbox"
        "/spnest/Inbox"

        "/local"

        "/feeds/personal/*"
        "/feeds/github"
        "/feeds/twitter"
        "/feeds/music/*"
        ))

(mu4e-maildirs-extension)

(define-key mu4e-main-mode-map "p"
  '(lambda () (interactive) (mu4e-maildirs-extension-force-update '(16))))

;; limit to 1000 results
(setq mu4e-maildirs-extension-count-command-format
      (concat mu4e-mu-binary " find %s -n 1000 --fields 'i' | wc -l"))

(provide 'setup-mu4e-maildir-extension)
