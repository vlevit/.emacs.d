;; Save clipboard strings into kill ring before replacing them.
(setq save-interprogram-paste-before-kill t)
;; Cutting and pasting uses the clipboard
(setq x-select-enable-clipboard t)

(defun path-to-clipboard ()
  "Copy the current file's path to the clipboard.
 If the current buffer has no file, copy the buffer's default directory."
  (interactive)
  (let ((path (expand-file-name (or (buffer-file-name) default-directory))))
    (if (string-equal system-type "windows-nt")
        (kill-new (replace-regexp-in-string "/" "\\\\" path))
      (kill-new path))
    (message "%s" path)))

(defun find-file-from-clipboard()
  "Open the file whose path is in the clipboard. Open if only the file exists."
  (interactive)
  (let ((clip (x-get-selection 'CLIPBOARD)))
    (find-file-existing clip)))

(global-set-key (kbd "M-\\") 'path-to-clipboard)
(global-set-key (kbd "C-S-f") 'find-file-from-clipboard)

(provide 'setup-clipboard)
