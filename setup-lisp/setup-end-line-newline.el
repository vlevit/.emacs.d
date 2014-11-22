(defun end-line-and-newline-and-indent()
  (interactive)
  (end-of-line)
  (newline-and-indent))

(global-set-key (kbd "M-o") 'end-line-and-newline-and-indent)

(provide 'setup-end-line-newline)
