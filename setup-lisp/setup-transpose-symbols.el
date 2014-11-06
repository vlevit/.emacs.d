(defun transpose-symbols (arg)
  "Interchange symbols around point, leaving point at end of them.
With prefix arg ARG, effect is to take word before or around
point and drag it forward past ARG other symbols (backward if ARG
negative). If ARG is zero, the symbols around or after point and
around or after mark are interchanged."
  (interactive "*p")
  (transpose-subr 'forward-symbol arg))

(define-key global-map [remap transpose-words] 'transpose-symbols)

(provide 'setup-transpose-symbols)
