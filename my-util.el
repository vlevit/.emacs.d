(defun url-escape-region (start end)
  (interactive "r")
  (let ((escaped (url-hexify-string (buffer-substring start end))))
    (delete-region start end)
    (insert escaped)))

(provide 'my-util)
