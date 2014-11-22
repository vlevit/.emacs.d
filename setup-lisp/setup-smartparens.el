(require 'smartparens)

(require 'smartparens-config)
(smartparens-global-mode t)

(setq sp-autoescape-string-quote nil)
(setq sp-highlight-pair-overlay nil)
;;; re-wrap region with any pair
(setq sp-wrap-repeat-last 2)

;; smartparens depends on cua-replace-region which was removed in Emacs 24.4
;; https://github.com/Fuco1/smartparens/issues/271
(unless (fboundp 'cua-replace-region)
  (defun cua-replace-region ()
    "Replace the active region with the character you type."
    (interactive)
    (let ((not-empty (and cua-delete-selection (cua-delete-region))))
      (unless (eq this-original-command this-command)
        (let ((overwrite-mode
               (and overwrite-mode
                    not-empty
                    (not (eq this-original-command 'self-insert-command)))))
          (cua--fallback))))))

(provide 'setup-smartparens)
