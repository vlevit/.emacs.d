(setq key-chord-two-keys-delay 0.2)
(setq key-chord-one-key-delay 0.3)

(key-seq-define-global "qe" (kbd "C-e"))
(key-seq-define-global "qa" (kbd "M-m"))
(key-seq-define-global "qc" 'my-set-dynamic-face)
(key-seq-define-global "hh" 'mark-whole-line)
(key-seq-define-global "qy" 'copy-whole-buffer)
(key-seq-define-global "q`" 'ido-switch-buffer)
(key-seq-define-global "qo" 'other-window)
(key-seq-define-global "qf" 'ido-find-file)
(key-seq-define-global "qh" 'find-file-in-repository)
(key-seq-define-global "qj" 'find-projects)
(key-seq-define-global "qd" 'sunrise-cd)
(key-seq-define-global "qg" 'magit-status)
(key-seq-define-global "qs" 'idomenu)
(key-seq-define-global "qb" 'ido-switch-buffer)
(key-seq-define-global "qv" 'clone-buffer)
(key-seq-define-global "qk" 'mu4e)
(key-seq-define-global "qn" (lambda () (interactive) (mu4e-headers-jump-bookmark ?u)))
(key-seq-define-global "qm" 'my-visual-line-mode-toggle)
(key-seq-define-global "qi" 'twit)
(key-seq-define-global "qr" 'point-to-register)
(key-seq-define-global "jr" 'jump-to-register)
(key-seq-define-global "jx" 'swiper)

(key-seq-define-global ",s" 'transpose-symbols)
(key-seq-define-global ",w" 'transpose-words)
(key-seq-define-global ",x" 'transpose-sexps)
(key-seq-define-global ",p" 'transpose-paragraphs)
(key-seq-define-global ",e" 'transpose-sentences)
(key-seq-define-global ",l" 'transpose-lines)
(key-seq-define-global ",c" 'transpose-chars)
(key-seq-define-global ",r" 'transpose-params)

;; typography
(key-seq-define text-mode-map " -" (kbd " — "))
(key-seq-define text-mode-map "``" (kbd "“"))
(key-seq-define text-mode-map "''" (kbd "”"))
(key-seq-define text-mode-map "<<" (kbd "«"))
(key-seq-define text-mode-map ">>" (kbd "»"))
(key-seq-define text-mode-map "`'" (kbd "́"))

(key-chord-mode 1)

(require 'iy-go-to-char)
(key-seq-define-global "fj" 'iy-go-up-to-char)
(key-seq-define-global "jf" 'iy-go-to-char-backward)

(provide 'setup-chord-keys)
