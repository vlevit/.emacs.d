(defun mark-whole-line ()
  (interactive)
  (beginning-of-line)
  (set-mark-command nil)
  (end-of-line))

(global-set-key (kbd "M-M") 'mark-whole-line)

(provide 'setup-mark-whole-line)
