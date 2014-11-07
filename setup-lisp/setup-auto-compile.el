(defun my-auto-compile ()
  "Compile itself if this is a config file"
  (interactive)
  (and (string-match "\\.el$" (buffer-file-name))
       (s-starts-with? (expand-file-name user-emacs-directory) (buffer-file-name))
       (byte-compile-file (buffer-file-name))))

(add-hook 'after-save-hook 'my-auto-compile)

(provide 'setup-auto-compile)
