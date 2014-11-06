;; http://stackoverflow.com/questions/6895155/multiple-asynchronous-shell-commands-in-emacs-dired/6895517#6895517

(defadvice shell-command (after shell-in-new-buffer (command &optional output-buffer error-buffer))
  (when (get-buffer "*Async Shell Command*")
    (with-current-buffer "*Async Shell Command*"
      (rename-uniquely))))
(ad-activate 'shell-command)

(provide 'setup-multiple-async-shell-commands)
