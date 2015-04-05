(defvar my-mu4e-default-filter "maildir:/feeds/* AND NOT opennet")

(defvar my-mu4e-cycle-filters
  '("maildir:/feeds/personal*"
    "maildir:/feeds/events*"
    "maildir:/feeds/music*"
    "maildir:/feeds/tech*"
    "maildir:/feeds/emacs*"
    "maildir:/feeds/humor*"
    "maildir:/feeds/jobs*"
    "maildir:/feeds/opennet*"
    ))

(defvar my-mu4e-counter 0)

(defun my-mu4e-search-filter-cycle (step)
  (interactive)
  (let ((current-counter (+ my-mu4e-counter (or  step 1))))
    (setq my-mu4e-counter (mod current-counter (length my-mu4e-cycle-filters)))
    (mu4e-headers-search (nth my-mu4e-counter my-mu4e-cycle-filters))))

(defun my-mu4e-search-filter-cycle-forward ()
  (interactive)
  (my-mu4e-search-filter-cycle 1))

(defun my-mu4e-search-filter-cycle-backward ()
  (interactive)
  (my-mu4e-search-filter-cycle -1))

(define-key mu4e-headers-mode-map "]" 'my-mu4e-search-filter-cycle-forward)
(define-key mu4e-headers-mode-map "[" 'my-mu4e-search-filter-cycle-backward)

(define-key mu4e-headers-mode-map "l"
  '(lambda ()
     (interactive)
     (mu4e-headers-search my-mu4e-default-filter)
     (setq my-mu4e-counter 1)))

(provide 'setup-mu4e-feeds)
