(add-hook 'after-save-hook
  'executable-make-buffer-file-executable-if-script-p)

(provide 'setup-executable)
