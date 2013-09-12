(key-chord-define-global "qn" (kbd "C-e C-j"))
(key-chord-define-global "qe" (kbd "C-e"))
(key-chord-define-global "qa" (kbd "M-m"))
(key-chord-define-global "hh" 'mark-whole-line)
(key-chord-define-global "q`" 'ido-switch-buffer)
(key-chord-define-global "qo" 'other-window)
(key-chord-define-global "qf" 'ido-find-file)

(key-chord-mode 1)

(require 'iy-go-to-char)
(key-chord-define-global "fg" 'iy-go-to-char)
(key-chord-define-global "hj" 'iy-go-to-char-backward)

(provide 'my-chord-keys)
