(require 'my-password)

(defun my-auto-zip()
  (when (string-match "/Text/father/.*\.txt" (buffer-file-name))
    (let ((text-file (file-name-nondirectory (buffer-file-name)))
          (zip-file (concat (file-name-nondirectory (buffer-file-name)) ".zip"))
          (password (my-password "purpose" "text")))
      (when (file-exists-p zip-file)
        (delete-file zip-file))
      (async-shell-command (concat "zip -P " password " " zip-file " " text-file)))))

(add-hook 'after-save-hook 'my-auto-zip)

(provide 'my-auto-zip)
