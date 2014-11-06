(define-key dired-mode-map [remap next-line] 'dired-next-line)
(define-key dired-mode-map [remap previous-line] 'dired-previous-line)

(setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^systemd-private")

(defun dired-xdg-open-file ()
  "Opens the current file in a Dired buffer."
  (interactive)
  (xdg-open-file (dired-get-file-for-visit)))

(defun xdg-open-file (filename)
  "xdg-opens the specified file."
  (interactive "fFile to open: ")
  (if (string-equal system-type "windows-nt")
      (async-shell-command (concat "cygstart \"" filename "\""))
    (async-shell-command (concat "setsid xdg-open \"" filename "\" &>/dev/null"))))

(define-key dired-mode-map (kbd "E") 'dired-xdg-open-file)
(define-key dired-mode-map (kbd "<S-return>") 'dired-xdg-open-file)

(setq wdired-allow-to-change-permissions t
      wdired-allow-to-redirect-links t)

(setq dired-guess-shell-alist-user
      (list (list "\\.\\(jpg\\|jpeg\\|png\\)\\'" "eog" "qiv" "gimp")
            (list "\\.\\(mkv\\|mp4\\|avi\\)\\'" "mplayer" "totem")))

(provide 'setup-dired)
