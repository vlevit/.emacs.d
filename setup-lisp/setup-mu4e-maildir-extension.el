(require 'mu4e-maildirs-extension)

(setq mu4e-maildirs-extension-custom-list
 `(,(@vlevit-folder "me" "Inbox")
   ,(@vlevit-folder "me" "Personal")
   ,(@vlevit-folder "me" "Admin")
   ,(@vlevit-folder "me" "Dev")
   ,(@vlevit-folder "me" "Work")
   ,(@vlevit-folder "me" "Bulk")
   ,(@vlevit-folder "me" "Junk")
   ,(@vlevit-folder "me" "Trash")
   ,(@vlevit-folder "me" "Sent")

   ,(@vlevit-folder "me" "Inbox")
   ,(@gmail-folder "alex.dyadya" "Inbox")
   ,(@gmail-folder "spnest" "Inbox")

   "/feeds/.personal.me"))

(mu4e-maildirs-extension)

(defun mu4e-maildirs-extension-force-update ()
  "Clear cache and insert maildirs summary."
  (interactive)
  (setq mu4e-maildirs-extension-cached-maildirs-data nil)
  (mu4e-maildirs-extension-update))

(provide 'setup-mu4e-maildir-extension)
