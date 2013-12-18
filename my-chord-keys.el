(setq key-chord-two-keys-delay 0.2)
(setq key-chord-one-key-delay 0.3)

(defun key-seq-define-global (keys command)
  "Like key-chord-define-global but the order of keys matters."
  (interactive "sSet key chord globally (2 keys): \nCSet chord \"%s\" to command: ")
  (key-seq-define (current-global-map) keys command))

(defun key-seq-define (keymap keys command)
  "Like key-chord-define but the order of keys matters."
  (if (/= 2 (length keys))
      (error "Key-chord keys must have two elements"))
  ;; Exotic chars in a string are >255 but define-key wants 128..255 for those
  (let ((key1 (logand 255 (aref keys 0)))
	(key2 (logand 255 (aref keys 1))))
    (if (eq key1 key2)
	(define-key keymap (vector 'key-chord key1 key2) command)
      ;; else
      (define-key keymap (vector 'key-chord key1 key2) command))))


(key-seq-define-global "qn" (kbd "C-e C-j"))
(key-seq-define-global "qe" (kbd "C-e"))
(key-seq-define-global "qa" (kbd "M-m"))
(key-seq-define-global "hh" 'mark-whole-line)
(key-seq-define-global "q`" 'ido-switch-buffer)
(key-seq-define-global "qo" 'other-window)
(key-seq-define-global "qf" 'ido-find-file)
(key-seq-define-global "qh" 'find-file-in-repository)
(key-seq-define-global "qd" 'sunrise-cd)

(key-chord-mode 1)

(require 'iy-go-to-char)
(key-seq-define-global "fg" 'iy-go-to-char)
(key-seq-define-global "hj" 'iy-go-to-char-backward)

(provide 'my-chord-keys)
