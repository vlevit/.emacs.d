(require 's)

(defun my-password (key value &rest keypairs)
  (shell-command-to-string
   (s-join " "  (append (list "secret-tool" "lookup" key value) keypairs))))

(provide 'my-password)
