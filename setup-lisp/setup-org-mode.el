(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t
      org-startup-indented t
      org-startup-folded nil
      org-html-postamble t
      org-html-postamble-format '(("en" "<p class=\"author\">Author: %a</p>\n<p class=\"creator\">%c</p>"))
      system-time-locale "C")         ; english names of days of weeks

(setq org-agenda-files (list "~/org/TODO"))

(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

(defun my-org-auto-update ()
  (when (string-match ".*/ironscales.org" (buffer-file-name))
    (org-update-all-dblocks)))

(defun my-org-auto-export ()
  (when (string-match ".*/ironscales.org" (buffer-file-name))
    (org-twbs-export-to-html)))

(add-hook 'before-save-hook 'my-org-auto-update)
(add-hook 'after-save-hook 'my-org-auto-export)

(provide 'setup-org-mode)
