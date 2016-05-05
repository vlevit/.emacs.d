(require 'mu4e-maildirs-extension)

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
        "/me/Sent"

        "/alex.dyadya/Inbox"
        "/spnest/Inbox"

        "/local"

        "/feeds/personal/*"
        "/feeds/github/*"))

(mu4e-maildirs-extension)

(defun my-mu4e-maildirs-update ()
  "Clear cache and insert maildirs summary."
  (setq mu4e-maildirs-extension-cached-maildirs-data nil)
  (mu4e-maildirs-extension-update))

(define-key mu4e-main-mode-map "p"
  '(lambda () (interactive) (mu4e-maildirs-extension-force-update '(16))))

(provide 'setup-mu4e-maildir-extension)
