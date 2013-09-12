(defun my-home ()
  (and (string-equal system-name "pc") (string-equal system-type "gnu/linux")))

(defun my-book()
  (and (string-equal system-name "book") (string-equal system-type "gnu/linux")))

(defun my-at-work ()
  (and (string-equal system-name "VLEVIT") (string-equal system-type "windows-nt")))

(provide 'my-whereami)
