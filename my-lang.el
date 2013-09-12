;; Why Emacs doesn't insert such beautiful ukrainian letter?
(define-key global-map (kbd "<Ukrainian_ghe_with_upturn>") (kbd "ґ"))
(define-key global-map (kbd "<Ukrainian_GHE_WITH_UPTURN>") (kbd "Ґ"))

;; Stolen from Emacs 24 or not???
(defun reverse-input-method (input-method)
  "Build the reverse mapping of single letters from INPUT-METHOD."
  (interactive
   (list (read-input-method-name "Use input method (default current): ")))
  (if (and input-method (symbolp input-method))
      (setq input-method (symbol-name input-method)))
  (let ((current current-input-method)
        (modifiers '(nil (control) (meta) (control meta))))
    (when input-method
      (activate-input-method input-method))
    (when (and current-input-method quail-keyboard-layout)
      (dolist (map (cdr (quail-map)))
        (let* ((to (car map))
               (from (quail-get-translation
                      (cadr map) (char-to-string to) 1)))
          (when (and (characterp from) (characterp to))
            (dolist (mod modifiers)
              (define-key function-key-map
                (vector (append mod (list from)))
                (vector (append mod (list to)))))))))
    (when input-method
      (activate-input-method current))))

(reverse-input-method 'cyrillic-jcuken)
(reverse-input-method 'ukrainian-computer)

(provide 'my-lang)


;; http://www.cofault.com/2011/12/cue-key.html
;; (mapcar* 
;;  (lambda (r e) ; R and E are matching Russian and English keysyms
;;    ; iterate over modifiers
;;    (mapc (lambda (mod)
;;     (define-key input-decode-map 
;;       (vector (list mod r)) (vector (list mod e))))
;;   '(control meta super hyper))
;;    ; finally, if Russian key maps nowhere, remap it to the English key without
;;    ; any modifiers
;;    (define-key local-function-key-map (vector r) (vector e)))
;;    "йцукенгшщзхъфывапролджэячсмитьбю"
;;    "qwertyuiop[]asdfghjkl;'zxcvbnm,.")
