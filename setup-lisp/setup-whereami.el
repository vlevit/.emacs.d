(defun my-home ()
  (and (string-equal system-name "pc") (string-equal system-type "gnu/linux")))

(defun my-book()
  (and (string-equal system-name "book") (string-equal system-type "gnu/linux")))

(defun my-at-ironscales ()
  (and (string-equal system-name "eyalbd1-VirtualBox") (string-equal system-type "gnu/linux")))

(provide 'setup-whereami)
