;; original source: http://www.emacswiki.org/emacs/InsertDate

(defun insert-date (prefix)
  "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
  (interactive "P")
  (let ((format (cond
                 ((not prefix) "%Y-%m-%d")
                 ((equal prefix '(4)) "%d.%m.%Y")
                 ((equal prefix '(16)) "%A, %d. %B %Y")
                 ((equal prefix '(64)) "%Y-%m-%d %H:%M:%S"))))
    (insert (format-time-string format))))

(global-set-key (kbd "C-c d") 'insert-date)

(provide 'setup-insert-date)
