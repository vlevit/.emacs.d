(when (require 'magit nil 'noerror)
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-x C-g") 'magit-status))

(provide 'my-git)
