;; https://stackoverflow.com/a/5148435
(add-hook 'hack-local-variables-hook 'run-local-vars-mode-hook)
(defun run-local-vars-mode-hook ()
  "Run a hook for the major-mode after the local variables have been processed."
  (run-hooks (intern (concat (symbol-name major-mode) "-local-vars-hook"))))

(provide 'setup-dir-locals)
