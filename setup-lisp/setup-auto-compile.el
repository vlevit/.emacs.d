(defun my-auto-compile ()
  "Compile itself if this is config file"
  (interactive)
  (if (or
       (string-match "my-[a-z-]+.el$" (buffer-file-name))
       (string-match "init.el$" (buffer-file-name)))
      (byte-compile-file (buffer-file-name))))

(add-hook 'after-save-hook 'my-auto-compile)

(provide 'setup-auto-compile)
