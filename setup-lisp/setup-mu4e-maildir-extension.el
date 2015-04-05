(require 'mu4e-maildirs-extension)

(setq mu4e-maildirs-extension-custom-list
      '("/me/Inbox"
        "/me/Personal"
        "/me/Admin"
        "/me/Dev"
        "/me/Work"
        "/me/Bulk"
        "/me/Junk"
        "/me/Trash"
        "/me/Sent"

        "/alex.dyadya/Inbox"
        "/spnest/Inbox"

        "/feeds/personal/*"))

(mu4e-maildirs-extension)

(defun my-mu4e-maildirs-update ()
  "Clear cache and insert maildirs summary."
  (setq mu4e-maildirs-extension-cached-maildirs-data nil)
  (mu4e-maildirs-extension-update))

(provide 'setup-mu4e-maildir-extension)
